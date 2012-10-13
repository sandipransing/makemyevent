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
  field :start_date, type: Time
  field :end_date, type: Time
  field :published, type: Boolean, default: false

  has_mongoid_attached_file :logo

  validates_presence_of :name, :short_desc, :organizer_name, :organizer_mobile_no, :location#, :start_date, :end_date

end
