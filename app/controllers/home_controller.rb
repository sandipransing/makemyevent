class HomeController < ApplicationController

  def index
    @feature_events = Event.featured
    @previous_events = Event.previous
    @upcoming_events = Event.upcoming
    @organizers = User.organizers.limit(5) 
  end
end
