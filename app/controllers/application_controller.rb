class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_filter :set_time_zone

  private def set_time_zone
     if user_signed_in?
        Time.use_zone('Central Time (US & Canada)') { yield }
     else
        yield
     end
  end 
end
