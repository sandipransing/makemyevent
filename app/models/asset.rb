# container_identifier is uniqueness for object
class Asset
  include Mongoid::Document
  include Mongoid::Paperclip

  field :is_primary, type: Boolean, default: false

  has_mongoid_attached_file :attachment, :styles => { :small => "75X75>", :medium => "200x200>", :large => "500x500>"}

  # when container(e.g event) form get submitted and it is not valid then uploaded images disappered from view
  # to avoid from this kind of problem we will use following field
  # this issue is only in event create
  field :container_identifier, type: String

  # several model(event) can have several assets
  # this fields keepthe model name
  field :container

  belongs_to :event

  validates_presence_of :container_identifier, :attachment

  # paperclip callbacks
  before_post_process :rename_file

  def rename_file
    extension = File.extname(attachment_file_name)
    self.attachment.instance_write(:file_name, "#{Time.now.to_i}#{extension}") 
  end
end

