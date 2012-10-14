module ApplicationHelper
  def display_errors(model)
    html = ""
    if model and !model.errors.blank?
      html << "<div class='alert alert-error'>"
      model.errors.each_with_index do |msg,i|
        if msg[0] != :image
          html << "#{msg[1]}<br/>"
        end
      end
      html << "</div>"
    end
    html.html_safe
  end

  def show_flash_messages(options = {})
    ret = []
    flash.each do |key, value|
      ret << content_tag( :div, {class: "flash alert alert-#{key} global", id: "flash-#{key}"}) do
        content = haml_tag "a.close", "data-dismiss" => "alert" 
        haml_concat value
      end
    end
    return_string = ret.join("\n")
    return return_string.respond_to?(:html_safe) ? return_string.html_safe : return_string
  end

  def participate_button(event, klass= 'button-big')
    if current_user && event.participants.include?(current_user)
        link_to('Leave', leave_event_path(event), class: klass)
    else
        link_to('Participate', participate_event_path(event), class: klass)
    end
  end

  def manage_button(event, klass='button-small')
   link_to('Manage', edit_event_path(@event), :class => "button-small") if current_user and @event.user.id == current_user.id
  end

  def add_assets_to_form(object)
    assets_tag = []
    assets = object.assets
    unless object.new_record?
      assets.each do |asset|
        unless asset.new_record?
          assets_tag << content_tag('li', class: 'span-li', id: "asset_#{asset.id.to_s}") do
            content_tag('div', class: 'thumbnail') do
              link_to("x", asset_path(asset), :method => :delete, :remote => true) +
              content_tag('div', class: 'thumbnail-75') do
                image_tag(asset.attachment.url(:small), data: {id: asset.id.to_s}) 
              end
            end
          end
        end
      end
    end
    unless object.errors.blank?
      unless @assets.blank?
        @assets.each do |asset|
          assets_tag << content_tag('li', class: 'span-li', id: "asset_#{asset.id.to_s}") do
            content_tag('div', class: 'thumbnail') do
              link_to("x", asset_path(asset), :method => :delete, :remote => true) +
              content_tag('div', class: 'thumbnail-75') do
                image_tag(asset.attachment.url(:small), data: {id: asset.id.to_s}) 
              end
            end
          end
        end
      end
    end
    content_tag('ul', class: "thumbnails photo") do
      assets_tag.join.html_safe
    end
  end
end

