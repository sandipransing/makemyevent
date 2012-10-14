# RailsAdmin config file. Generated on October 14, 2012 15:56
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Make My Event', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_admin } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'Admin'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'Admin'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Asset', 'Event', 'Service', 'User']

  # Include specific models (exclude the others):
  # config.included_models = ['Asset', 'Event', 'Service', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block
  
  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Asset  ###

  # config.model 'Asset' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your asset.rb model definition
  
  #   # Found associations:

  #     configure :event, :belongs_to_association 

  #   # Found columns:

  #     configure :_type, :text         # Hidden 
  #     configure :_id, :bson_object_id 
  #     configure :is_primary, :boolean 
  #     configure :attachment_file_name, :text         # Hidden 
  #     configure :attachment_content_type, :text         # Hidden 
  #     configure :attachment_file_size, :integer         # Hidden 
  #     configure :attachment_updated_at, :datetime         # Hidden 
  #     configure :attachment, :paperclip 
  #     configure :container_identifier, :text 
  #     configure :container, :string 
  #     configure :event_id, :bson_object_id         # Hidden 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Event  ###

  config.model 'Event' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your event.rb model definition
  
  #   # Found associations:

       configure :user, :belongs_to_association 
       configure :assets, :has_many_association 

  #   # Found columns:

  #     configure :_type, :text         # Hidden 
       configure :_id, :bson_object_id 
  #     configure :_slugs, :serialized 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
       configure :name, :string 
       configure :short_desc, :string 
       configure :description, :string 
       configure :organizer_name, :string 
       configure :organizer_mobile_no, :string 
       configure :location, :string 
  #     configure :lat, :string 
  #     configure :lng, :string 
       configure :start_date, :datetime 
       configure :end_date, :datetime 
       configure :published, :boolean 
       configure :featured, :boolean 
  #     configure :unique_identifier, :text 
  #     configure :user_id, :bson_object_id         # Hidden 
  #     configure :logo_file_name, :text         # Hidden 
  #     configure :logo_content_type, :text         # Hidden 
  #     configure :logo_file_size, :integer         # Hidden 
  #     configure :logo_updated_at, :datetime         # Hidden 
  #     configure :logo, :paperclip 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
       edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Service  ###

  # config.model 'Service' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your service.rb model definition
  
  #   # Found associations:

  #     configure :user, :belongs_to_association 

  #   # Found columns:

  #     configure :_type, :text         # Hidden 
  #     configure :_id, :bson_object_id 
  #     configure :provider, :string 
  #     configure :uid, :string 
  #     configure :uname, :string 
  #     configure :uemail, :string 
  #     configure :screen_name, :string 
  #     configure :image_url, :string 
  #     configure :user_id, :bson_object_id         # Hidden 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  User  ###

  # config.model 'User' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition
  
  #   # Found associations:

  #     configure :services, :has_many_association 
  #     configure :events, :has_many_association 

  #   # Found columns:

  #     configure :_type, :text         # Hidden 
  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :_slugs, :serialized 
  #     configure :name, :string 
  #     configure :dob, :date 
  #     configure :job_title, :string 
  #     configure :email, :string 
  #     configure :education, :string 
  #     configure :mobile, :string 
  #     configure :website, :string 
  #     configure :about, :string 
  #     configure :address, :string 
  #     configure :photo_file_name, :text         # Hidden 
  #     configure :photo_content_type, :text         # Hidden 
  #     configure :photo_file_size, :integer         # Hidden 
  #     configure :photo_updated_at, :datetime         # Hidden 
  #     configure :photo, :paperclip 

  #   # Cross-section configuration:
  
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  
  #   # Section specific configuration:
  
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
