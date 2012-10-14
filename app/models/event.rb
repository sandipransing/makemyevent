class Event
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :name
  slug :name
  field :short_desc
  field :description
  field :organizer_name
  field :organizer_mobile_no
  field :location
  field :lat
  field :lng
  field :start_date, type: Time
  field :end_date, type: Time
  field :published, type: Boolean, default: false
  field :featured, type: Boolean, default: false
  field :unique_identifier, type: String #used for assets identifiction

  belongs_to :user, inverse_of: :events

  has_many :assets, :autosave => true
  has_and_belongs_to_many :participants, class_name: 'User', inverse_of: :participated_events

  has_mongoid_attached_file :logo, :styles => { :small => "50x50!", :medium => "100x100!", :large => "200x200!", :extra_large => "450x190!" }

  validates_presence_of :name, :message => "Name can't blank."
  validates_presence_of :short_desc, :message => "Short description can't blank."
  validates_presence_of :organizer_name, :message => "Organizer name can't blank."
  validates_presence_of :organizer_mobile_no, :message => "Organizer mobile number can't blank."
  validates_presence_of :location, :message => "Location can't blank."
  validates_presence_of :start_date, :message => "Start Date can't blank."
  validates_presence_of :end_date, :message => "End Date can't blank."
  validates_attachment :logo, :content_type => { :content_type =>['image/jpeg', 'image/png', 'image/gif'], :message => 'Image format should be jpg, png, gif.'},:size => { :in => 0..1024.kilobytes, :message => 'Logo image size should be less than 1Mb.'}

  validate :check_date
  after_save :assign_images

  def check_date
    errors.add(:start_date, "Start Date should be greater than today's date") if !self.start_date.blank? and self.start_date < Time.now
    errors.add(:end_date, "End Date should be greater than today's date") if !self.end_date.blank? and self.end_date < Time.now
  end

  scope :published, where(:published => true)
  scope :featured, where(:featured => true).published
  scope :previous, where(:start_date.lt => Date.today).order_by('end_date DESC').published
  scope :upcoming, where(:start_date.gt => Date.today).limit(5).order_by('start_date ASC').published


  def assign_images
    assets = Asset.where(container_identifier: unique_identifier, container: self.class.to_s.underscore, is_primary: false)
    assets.each do |asset|
      asset.update_attributes(:is_primary => true, :event_id => self.id)
    end
  end

  def as_json(options = {})
    options = {:only => [:_id, :name, :featured], :methods => [:upcoming_event, :previous_event]} 
    super
  end

  def upcoming_event
    self.start_date > Date.today
  end

  def previous_event
    self.start_date < Date.today
  end
end
