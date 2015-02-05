class AreasController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :create, :new, :destroy, :index]
  before_action :correct_hospital, only: [:show, :edit, :update, :create, :new, :destroy, :index]
  
  include HospitalsHelper

  def new
  	@area = Area.new
  end

  def index
  	@hospital = Hospital.find(params[:hospital_id])
  	@floors = floors_hospital
  	@floor = params[:floor_id]
  	@areas = Area.where(hospital_id: params[:hospital_id]).where(floor: params[:floor_id])
  end

  def edit
  	@floors = floors_hospital
  	@floor = params[:floor_id]
  	@hospital = Hospital.find(params[:hospital_id])
  	@area = Area.find(params[:id])
  end

  def update
  	@area = Area.find(params[:id])
   if @area.update_attributes(area_params)
      flash[:success] = "Área actualizada"
      redirect_to hospital_floor_area_path(@area.hospital_id, @area.floor, @area)
   else
    render  edit_hospital_floor_area_path(@area.hospital_id, @area.floor, @area)
   end
  end

  def show
  	@hospital = Hospital.find(params[:hospital_id])
  	@floors = floors_hospital
  	@floor = params[:floor_id]
  	@areas = Area.where(hospital_id: params[:hospital_id]).where(floor: params[:floor_id])
  	@area = Area.find(params[:id])
  	@contact = @area.contact
  	@subareas = @area.subareas
  end

  def new
  	@floors = floors_hospital
  	@floor = params[:floor_id]
  	@hospital = Hospital.find(params[:hospital_id])
  	@area = Area.new
  end

  def subareas_select
  	@subarea = Subarea.new
  	 		
  	if Integer(params[:id]) != 0 
			@area = Area.find(params[:id])
			@areas = Area.where(floor: @area.floor).where(hospital_id: params[:hospital_id])
			@subareas = Subarea.where(area_id: params[:id])			
		else
			@subareas = nil
		end

  	respond_to do |format|
			format.js
		end
  end

	def create
		@area = Area.new(area_params)
		respond_to do |format|
		  if @area.save
		    format.js {}
        format.html { redirect_to hospital_floor_area_path(@area.hospital_id, @area.floor, @area)}
		  else
		    format.html { render new_area_path }
        format.js {}
		  end		
		end
    @floors = floors_hospital
		@areas = Area.where(floor: @area.floor).where(hospital_id: params[:hospital_id])
	end

  private
    def area_params
      params.require(:area).permit(:name, :description, :floor, :contact_id, :hospital_id)
    end
end
