class EventsController < ApplicationController
  before_filter :get_event, :except => [:index, :new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    @event.attributes = params[:event]
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

  def get_event
    @event =  Event.find_by(:_slugs => params[:id])
  end
end
