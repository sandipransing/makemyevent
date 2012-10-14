class AccountController < ApplicationController
  before_filter :authenticate_user!, :except => [:profile]
  before_filter :load_user, :only => [:profile]

  def show
    @user = current_user
    @events = @user.events 
    @past_events = @user.events.previous
    @upcoming_events = @user.events.upcoming
  end
  
  def edit
    @user = current_user
  end

  def profile
    @events = @user.events 
    @past_events = @user.events.previous
    @upcoming_events = @user.events.upcoming
    render :action => :show
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Account information updated !'
      redirect_to :action => :show
    else
      render :action => :edit
    end
  end

  private

  def load_user
    @user = User.where(:_slugs => params[:slug]).first
    @user || invalid_url!
  end
end
