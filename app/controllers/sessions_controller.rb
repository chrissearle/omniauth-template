class SessionsController < ApplicationController
  def index
  end

  def create
    auth = request.env["omniauth.auth"]

    if current_user
      authentication = current_user.authentications.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Authentication.add_with_omniauth(current_user, auth)
    else
      authentication = Authentication.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Authentication.create_with_omniauth(auth)
    end

    session[:user_id] = authentication.user_id

    redirect_to root_path
  end

  def destroy
    session.delete :user_id

    redirect_to root_path
  end
end
