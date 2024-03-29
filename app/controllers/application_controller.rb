class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :user_signed_in?, :get_idea_quote, :my_profile?

  private  
  def current_user  
    @current_user ||= User.where(:id => session[:user_id]).first if session[:user_id]  
  end

  def user_signed_in?
    current_user 
  end

  def authenticate_user!
    unless current_user
      flash[:error] = 'You need to sign in before accessing this page!'
      redirect_to (request.referrer ||  root_url)
    end
  end    

  def my_profile?(user)
    return false unless current_user
    current_user == user
  end

  def invalid_url!
    flash[:error] = 'Invalid URL !!!'
    redirect_to root_url and return
  end
end
