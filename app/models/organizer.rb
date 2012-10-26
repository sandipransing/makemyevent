class Organizer
  include Mongoid::Document

  field :name
  field :email
  field :mobile
  field :description

  has_and_belongs_to_many :users, autosave: true, inverse_of: :organizers
  has_many :events, dependent: :destroy, inverse_of: :events
  
  validates :name, :email, :mobile, :description, presence: true
end
