class AccountsController < ApplicationController
  include HospitalsHelper
  def new
  	@plan = Plan.find(params[:plan_id])
  	@hospital = Hospital.find(params[:hospital_id])
  	@user = User.find(params[:user_id])
  end

  def show
    @account = Account.find_by(hospital_id: current_hospital.id)
    @user = User.find(@account.user_id)
    @hospital = Hospital.find(@account.hospital_id)
    @plan = Plan.find(@account.plan_id)
  end

  def create
  	@account = Account.new(account_params)
    @user = User.find(@account.user_id)
    if @account.save
      redirect_to profile_path(@user.nickname)
    else
      render 'new'
    end
  end

  def destroy
    @hospital = Hospital.find(params[:hospital_id]).destroy
    @user = User.find(params[:user_id]).destroy
    redirect_to noaccount_path
  end

  private
  	def account_params
  		params.permit(:plan_id, :hospital_id, :user_id)
  	end
end
