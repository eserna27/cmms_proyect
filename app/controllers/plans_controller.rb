class PlansController < ApplicationController
  before_action :master_user, only: [:new, :edit, :create]

  def new
  	@plan = Plan.new
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      flash[:success] = "Plan actualizado"
      redirect_to @plan
   else
    render  edit_plan_path(@plan)
   end
  end

  def show
    @plan = Plan.find(params[:id])    
  end

  def create
  	 @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to plans_path
    else
      render 'new'
    end
  end

  def index
    @plans = Plan.all
    if !logged_in?
      render :layout => "home_layout"
    end
  end

  private

    def plan_params
      params.require(:plan).permit(:name, :cost, :description, :max_equipment, :max_area )
    end
end
