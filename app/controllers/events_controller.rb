class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :get_event, :except => [:index, :new, :create]
  before_filter :load_user, :only => [:certificate]

  def index
    @events = Event.all.order_by('created_at DESC')
  end

  def new
    @event = Event.new
  end

  def edit
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

  def certificate
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
end
