class ApplicationController < ActionController::Base
    include SessionsHelper
    def logged_in_user
        unless logged_in?
            flash[:info]="Please login first."
            redirect_to root_path
        end
    end
    def admin_user
        if !current_user.admin == true
            flash[:danger]="You don't have permission"
            redirect_to root_path
        end
    end
end
