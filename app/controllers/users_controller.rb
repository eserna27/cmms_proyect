class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]

  include HospitalsHelper

  def show
  	@user = User.find(params[:id])
    @equipments = Equipment.where(hospital_id: current_hospital.id).last(5)
    @areas = Area.where(hospital_id: current_hospital.id).last(5)
    @contacts = Contact.where(hospital_id: current_hospital).last(5)
  end

  def edit
    @user = User.find(params[:id])
    @hospital = Hospital.find(current_hospital.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Usuario actualizado"
      redirect_to @user
   else
    render @user
   end
  end

  def new
    @user = User.new
    @hospital = Hospital.find(params[:hospital_id])
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
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :hospital_id)
    end
end
