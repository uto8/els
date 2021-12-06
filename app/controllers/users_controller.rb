class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  def new
    @user=User.new
  end
  def index
    @users = User.paginate(page: params[:page], per_page: 10).order(created_at: :desc)   

  end
  def show
    @user = User.find(params[:id])
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
