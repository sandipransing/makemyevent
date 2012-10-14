class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :get_event, :except => [:index, :new, :create]
  before_filter :un_wanted_assets_delete, :only => [:index, :show, :edit, :new]
  before_filter :load_user, :only => [:certificate]

  def index
    @events = Event.all.order_by('created_at DESC')
  end

  def new
    @event = Event.new
    @event.unique_identifier = Time.now.to_i
  end

  def edit
    @event.unique_identifier = Time.now.to_i if @event.unique_identifier.nil? 
  end

  def create
    @event = Event.new(params[:event])
    @event.user = current_user
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    @event.attributes = params[:event]
    @event.user = current_user
    if @event.save
      redirect_to  event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.delete
    redirect_to  events_path
  end

  def e_certificate
  end

  def certificate
    html = render_to_string(:action => "e_certificate.html.erb", :layout => false)
    kit = PDFKit.new(html)
    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/certificate.css"
    send_data(kit.to_pdf, :filename => 'report.pdf', :type => 'application/pdf')
  end

  private
  def get_event
    @event =  Event.find_by(:_slugs => params[:id])
    @event || invalid_url!
  end

  def load_user
    @user = User.where(:_slugs => params[:slug]).first
    @user || invalid_url!
  end

  def un_wanted_assets_delete
    assets = Asset.where(is_primary: false)
    assets.delete_all unless assets.blank?
  end
end
