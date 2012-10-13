class Event
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  #include ActsAsTaggable::Taggable

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

  has_mongoid_attached_file :logo, :styles => { :small => "50>", :medium => "100>", :large => "200>" }

  validates_presence_of :name, :message => "Name can't blank."
  validates_presence_of :short_desc, :message => "Short description can't blank."
  validates_presence_of :organizer_name, :message => "Organizer name can't blank."
  validates_presence_of :organizer_mobile_no, :message => "Organizer mobile number can't blank."
  validates_presence_of :location, :message => "Location can't blank."
  validates_presence_of :start_date, :message => "Start Date can't blank."
  validates_presence_of :end_date, :message => "End Date can't blank."
  validates_attachment :logo, :content_type => { :content_type =>['image/jpeg', 'image/png', 'image/gif'], :message => 'Image format should be jpg, png, gif.'},:size => { :in => 0..1024.kilobytes, :message => 'Logo image size should be less than 1Mb.'}

  validate :check_date

  def check_date
    errors.add(:start_date, "Start Date should be greater than today's date") if !self.start_date.blank? and self.start_date < Time.now
    errors.add(:end_date, "End Date should be greater than today's date") if !self.end_date.blank? and self.end_date < Time.now
  end

end
