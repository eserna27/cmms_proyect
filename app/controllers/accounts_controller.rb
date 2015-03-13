class AccountsController < ApplicationController

  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update, :destroy ]
  
  def new
  	@plan = Plan.find(params[:plan_id])
  	@hospital = Hospital.find(params[:hospital_id])
  	@user = User.find(params[:user_id])
    render :layout => "home_layout"
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
      log_in @user
      @plan = Plan.find(@account.plan_id)
      UserMailer.new_account(@user,@plan).deliver_now
      redirect_to user_path(@user)
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

    def correct_account_user
      @account = Account.find(params[:id])
      redirect_to(root_url) unless @account.user_id == current_user.id
    end
end
