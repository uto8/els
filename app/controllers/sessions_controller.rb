class SessionsController < ApplicationController
  def new
    @user= User.new
  end
  def create
    user=User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success]="Successfully logged in."
      redirect_to root_url
    else
      flash[:danger] ="Invalid Credentials"
      redirect_to login_url
    end
  end
  def destroy
    log_out
    flash[:success]="Successfully logout."
    redirect_to root_url
  end
end
