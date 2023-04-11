class ApplicationController < ActionController::Base

protect_from_forgery 
before_action :authenticate_user!

  def access_denied(exception)
    redirect_to admin_dashboard_path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
      if current_user.role == 'admin'
        admin_dashboard_path
      else
        admin_user_path(current_user)
      end
  end
end