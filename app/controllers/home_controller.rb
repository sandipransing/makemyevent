class HomeController < ApplicationController

  def index
    @feature_events = Event.featured
    @previous_events = Event.previous
    @upcoming_events = Event.upcoming
    #@organizers = Event.upcoming.users
  end
end
