class SubareasController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :create, :new, :destroy]
  before_action :correct_hospital, only: [:show, :edit, :update, :create, :new, :destroy]

  def new
  	@subarea = Subarea.new
  	@area = Area.find(params[:area_id])
  end

  def show
    @hospital = Hospital.find(params[:hospital_id])
    @floors = floors_hospital
    @area = Area.find(params[:area_id])
    @floor = @area.floor
    @areas = Area.where(hospital_id: params[:hospital_id]).where(floor: @floor)
    @contact = @area.contact
    @subareas = @area.subareas
    @subarea = Subarea.find(params[:id])
    @equipments = @subarea.equipments
  end
  
  def create
		@subarea = Subarea.new(subarea_params)

		respond_to do |format|
		  if @subarea.save
		    format.js {}
		    @area = Area.find(@subarea.area_id)
		    format.html { redirect_to hospital_floor_area_path(@area.hospital_id, @area.floor, @area)}
		  else
		    format.html { render new_subarea_path }
		    format.js {}
		  end		
		end
		@area = Area.find(@subarea.area_id)
		@areas = Area.where(floor: @area.floor)
		@subareas = @area.subareas
		@subarea = Subarea.new
	end

	def edit
		@subarea = Subarea.find(params[:id])
  	@area = Area.find(params[:area_id])
	end

	def update
  	@subarea = Subarea.find(params[:id])
  	@area = Area.find(@subarea.area_id)
   if @subarea.update_attributes(subarea_params)
      flash[:success] = "Subárea actualizada"
      redirect_to hospital_floor_area_path(@area.hospital_id, @area.floor, @area)
   else
    render  edit_hospital_floor_area_path(@area.hospital_id, @area.floor, @area)
   end
	end

	def destroy
    @subarea = Subarea.find(params[:id])
    @area = Area.find(@subarea.area_id)
    @subarea.destroy
    flash[:warning] = "Subarea Eliminada"
    redirect_to  hospital_floor_area_path(@area.hospital_id, @area.floor, @area)
  end

  private
    def subarea_params
      params.require(:subarea).permit(:name, :area_id)
    end
end
