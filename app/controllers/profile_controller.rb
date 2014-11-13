class ProfileController < ApplicationController
  
  def show
  	@user = User.find_by!(nickname: params[:nickname_user])
  end

end
