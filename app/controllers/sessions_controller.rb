class SessionsController < ApplicationController
  
  def new
    render :layout => "home_layout"
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user_path(user)

  	else
      flash.now[:danger] = 'Usuario incorrecto'
	  	render 'new', :layout => "home_layout"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
