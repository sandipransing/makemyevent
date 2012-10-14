class AssetsController < ApplicationController
  protect_from_forgery except: [:create, :destroy]
  before_filter do
    authenticate_user!
    @resource = Asset
    @resource_name = :asset
  end

  def show
    @asset = Asset.find(params[:id])
    if Rails.env.production?
      require 'open-uri'
      send_file(open(URI.parse(@asset.attachment.url(:original, false))), 
                disposition: 'inline', 
                type: @asset.attachment_content_type,
                filename: @asset.attachment_file_name)
    elsif Rails.env.development?
      send_file("public#{@asset.attachment.url(:original, false)}", disposition: 'inline', type: @asset.attachment_content_type)
    end
  end

  def new
    @asset = Asset.new
    render 'new', layout: false
  end
  
  def create
    container_name = params[:container]
    @asset = Asset.new(
                        {attachment: params[:attachment], 
                        type: params[:asset_type],                         
                        container_identifier: params[:container_identifier],
                        container: container_name}
                      )

    respond_to do |format|
      if @asset.save 
        return_data = @asset.as_json.merge({url: @asset.attachment.url(:small), user_side_identifier: params[:user_side_identifier], modal: @asset.container})
        format.html {  
          render :json => return_data,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { 
          render json: return_data 
        }
      else
        format.json { render json: nil }
      end
    end
  end

  def destroy
    if request.xhr?
      @asset = Asset.find(params[:id])
      @res = @asset.destroy

      # if deleted asset was primary then make last uploaded asset primary
      @updated_asset = nil

      respond_to do |format|
        format.js {render 'after_destroy'}
      end
    end
  end

end
