class AuthenticatedController < ApplicationController
  before_filter :authenticate_user

  private

  def authenticate_user
    unless current_user
      redirect_to login_path
    end
  end
end