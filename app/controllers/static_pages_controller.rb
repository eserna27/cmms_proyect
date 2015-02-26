class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		redirect_to user_path(current_user)
    else
      render :layout => "home_layout"
    end
  end

  def about
  end

  def complete
  	@user = User.first
  end
end
