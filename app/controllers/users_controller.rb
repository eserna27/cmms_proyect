class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_plan_hospital_user_account_path(params[:plan_id],params[:hospital_id],@user.id)
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
    end
end
