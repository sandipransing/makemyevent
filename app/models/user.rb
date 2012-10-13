class User
  include Mongoid::Document
  include Mongoid::Paperclip
    
  field :first_name
  field :last_name
  field :dob
  field :job_title
  field :email
  field :education
  field :mobile
  field :website
  field :address

  has_mongoid_attached_file :photo

end
