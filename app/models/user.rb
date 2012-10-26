class User
  Email_regex = /^([^@]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$/i
  
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps
  include Mongoid::Slug
    
  field :name
  slug :name
  field :dob, type: Date
  field :job_title
  field :email
  field :education
  field :mobile
  field :website
  field :about
  field :address

  has_mongoid_attached_file :photo,
    :styles => { large: ['200x200>', :jpg], thumb: ['75x75>', :jpg], medium: ['100x100>', :jpg], small: ['50x50>', :jpg]}

  has_many :services, :dependent => :destroy, :autosave => true
  has_many :events, :dependent => :destroy, :autosave => true, :inverse_of => :user
  has_and_belongs_to_many :organizers, :autosave => true, :inverse_of => :users

  has_and_belongs_to_many :participated_events, class_name: 'Event', inverse_of: :participants 

  validates :name, :presence => true
  validates_uniqueness_of :email, :allow_blank => true
  validates_format_of :email, :with => Email_regex, :message => "Email format is invalid", :allow_blank => true
  validates_format_of :website, :with => /^http:\/\/.+$/, :message => "Website format is invalid", :allow_blank => true

  scope :organizers, where(:events.ne => [])
end
