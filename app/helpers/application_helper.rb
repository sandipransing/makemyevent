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

  def add_assets_to_form(object)
    assets_tag = []
    assets = object.assets
    unless object.new_record?
      assets.each do |asset|
        unless asset.new_record?
          assets_tag << content_tag('li', class: 'span-li', id: "asset_#{asset.id.to_s}") do
            content_tag('div', class: 'thumbnail') do
              link_to("x", asset_path(asset), :method => :delete, :remote => true) +
              image_tag(asset.attachment.url(:small), data: {id: asset.id.to_s}) 
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
              image_tag(asset.attachment.url(:small), data: {id: asset.id.to_s}) 
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

