module Admin
class UsersController < ApplicationController
    load_and_authorize_resource
    def index 
        @users=User.all
    end
    def destroy 
        @user=User.find(params[:id])
        @user.destroy
        redirect_to admin_users_path
    end
end
end
