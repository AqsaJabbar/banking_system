class ApplicationController < ActionController::Base
     before_action :authenticate_user!
     def after_sign_in_path_for(resource)
          accounts_path
     end
     rescue_from CanCan::AccessDenied do |exception|  
          flash[:error] = "Access denied!"  
          redirect_back fallback_location: accounts_path  
      end 
end
