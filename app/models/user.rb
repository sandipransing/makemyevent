class User
  include Mongoid::Document
  include Mongoid::Paperclip
    
  field :name
  field :dob
  field :job_title
  field :email
  field :education
  field :mobile
  field :website
  field :address

  has_mongoid_attached_file :photo,
    :styles => { large: ['200x200>', :jpg], thumb: ['75x75>', :jpg], medium: ['100x100>', :jpg]},
    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
    :url => "/system/:class/:attachment/:id/:style/:filename"

  has_many :services, :dependent => :destroy, :autosave => true

  validates :name, :presence => true
  validate :email, :uniqueness => true
end
