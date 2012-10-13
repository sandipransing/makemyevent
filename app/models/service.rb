class Service
  include Mongoid::Document

  field :provider
  field :uid
  field :uname
  field :uemail
  field :screen_name
  field :image_url

  belongs_to :user

  before_save :fix_image_url
  after_save :upload_user_image

  def fix_image_url
    self.image_url = case provider
    when 'twitter' then self.image_url.gsub('normal', 'bigger')
    when 'facebook' then self.image_url.gsub('type=square', 'type=large')
    end
  end

  def upload_user_image
    io = open(URI.parse(image_url))
    def io.original_filename; base_uri.path.split('/').last; end
    user.update_attributes( :photo => io.original_filename.blank? ? nil : io)
  rescue # execuse image download errors
  end
end
