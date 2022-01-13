class PagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(current_user.id)
      @activity_feeds= @user.activities
    end
    
  end
  def about
  end
  def contact    
  end
  
end
