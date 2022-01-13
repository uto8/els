class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :correct_user, only: :edit
  def new
    @user=User.new
  end
  def index
    @users = User.paginate(page: params[:page], per_page: 10).order(created_at: :desc)   

  end
  def show
    @user = User.find(params[:id])
    @activity_feeds= @user.activities
  end
  def edit
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile Updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end
  def following
    @users = User.find(params[:id])
    @following = @users.following.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end
  def followers
    @users = User.find(params[:id])
    @followers = @users.followers.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end
  def words_learned
    @user = User.find(params[:id])
    @words = @user.answers.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confimation)
    end
    def correct_user
      user=User.find(params[:id])
      if user !=current_user
        flash[:danger]="You are not authorized."
        redirect_to root_url
      end
    end
end
