class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		redirect_to profile_path(current_user.nickname)
    end
  end

  def about
  end

  def complete
  	@user = User.first
  end
end
