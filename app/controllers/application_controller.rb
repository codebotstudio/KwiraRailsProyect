class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  around_filter :set_time_zone

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :permission_level, :store_id, :address, :schedule, :status, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:address, :current_password)
    }
  end

  private def set_time_zone
     if user_signed_in?
        Time.use_zone('Central Time (US & Canada)') { yield }
     else
        yield
     end
  end 
end
