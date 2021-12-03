class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def index
  end
  def show
  end
  def edit
  end
  def create
    @user = User.new(user_params)
     if @user.save
      flash[:success] = "Successfully Created account"
      redirect_to root_url
     else
      render "new"
     end
  end
  def update
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confimation)
    end
end
