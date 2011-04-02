class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_current_user

  helper_method :current_user

  def current_user
    @current_user if defined?(@current_user)
  end

  private

  def get_current_user
    if session.has_key? :user_id
      begin
        @current_user = User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound
        logger.warn "User #{session[:user_id]} requested but not found"
      end
    end
  end
end
