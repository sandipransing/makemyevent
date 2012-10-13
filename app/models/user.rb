class User
  include Mongoid::Document

  field :first_name
  field :last_name
  field :dob
  field :job_title
  field :email
  field :education
  field :mobile
  field :website
  field :address, type: Text

  has_mongoid_attached_file :photo

end
