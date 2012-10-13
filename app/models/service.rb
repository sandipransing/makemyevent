class Service
  include Mongoid::Document

  field :provider
  field :uid
  field :uname
  field :uemail
  field :screen_name

  belongs_to :user
end
