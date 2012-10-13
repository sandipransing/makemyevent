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

  validates_presence_of :name, :short_desc, :organizer_name, :organizer_mobile_no, :location, :start_date, :end_date

  scope :published, where(:published => true)
  scope :featured, where(:featured => true).published
  scope :previous, where(:start_date.lt => Date.today).order_by('end_date DESC').published
  scope :upcoming, where(:start_date.gt => Date.today).limit(5).order_by('start_date ASC').published
end
