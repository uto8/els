class Admin::UsersController < ApplicationController
  def index
    @users=User.all
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
