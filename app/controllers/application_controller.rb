class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def after_sign_in_path_for(resource)
    	if current_user.admin?
    		admin_path
    	else
    		dashboard_path
    	end
    end
end
