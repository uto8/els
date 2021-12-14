class Admin::PagesController < ApplicationController
  before_action :admin_user, only: :home
  before_action :logged_in_user
  def home
    @users=User.all
  end
end
