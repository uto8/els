class Admin::UsersController < ApplicationController
  before_action :admin_user, only: :home
  before_action :logged_in_user
  def index
    @users=User.paginate(page: params[:page], per_page: 10).order(created_at: :desc) 
    @user=User.find_by(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update_attribute(:admin, true)
    redirect_to admin_users_path
  end
  def destroy
    @user= User.find(params[:id])
    @user.update_attribute(:admin, false)
    redirect_to admin_users_path
  end
end
