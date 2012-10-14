class AccountController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @events = @user.events 
    @past_events = @user.events.previous
    @upcoming_events = @user.events.upcoming
  end
  
  def edit
    @user = current_user
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
end
