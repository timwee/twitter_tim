# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :set_user

  def authorize
    unless !session[:user_id].nil?
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please Log in"
      redirect_to login_url
    end
  end

  private
  def set_user
    current_id = session[:user_id]
    if current_id
      @current_user = User.find(current_id)
    end

  end
end
