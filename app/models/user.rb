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

  has_mongoid_attached_file :photo

  has_many :services, :dependent => :destroy, :autosave => true

  validates :name, :presence => true
end
