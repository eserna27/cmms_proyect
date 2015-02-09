class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  def new
  end

  def create
  	@user = User.find_by(email: params[:password_reset][:email].downcase)
  	if @user
  		@user.create_reset_digest
  		@user.send_password_reset_email
  		flash[:info] = "Correo enviado"
  		redirect_to root_path
  	else
  		flash.now[:danger] = "Correo no encontrado"
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if password_blank?
  		flash.now[:danger] = "La contraseña no puede ser vacia"
  		render 'edit'
  	elsif @user.update_attributes(user_params)
  		log_in @user
  		flash[:success] = "Contraseña actualizada"
  		redirect_to @user
  	else
  		render 'edit'
  	end  		
  end

  private

  	def user_params
  		params.require(:user).permit(:password, :password_confirmation, :email)		
  	end

  	def password_blank?
  		params[:user][:password].blank?
  	end

  
  	def get_user
  		@user = User.find_by(email: params[:email])
  	end

  	def valid_user
  		unless (@user && @user.authenticated?(:reset, params[:id]))
  			redirect_to root_url
  		end
  	end

  	def check_expiration
  		if @user.password_reset_expired?
  			flash[:danger] = "URL para recuperar contraseña expiro"
  			redirect_to new_password_reset_url
  		end
  	end
end
