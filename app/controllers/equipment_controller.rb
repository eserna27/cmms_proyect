class EquipmentController < ApplicationController
	include HospitalsHelper

	def new
    @equipment = Equipment.new
    @equipment_type = EquipmentType.new
    @equipment_types = EquipmentType.where(hospital_id: params[:hospital_id])
    @brand = Brand.new
    @brands = Brand.where(hospital_id: params[:hospital_id])
    @floors = floors_hospital
    @areas = current_hospital.areas
    @area = Area.new
    @subarea = Subarea.new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
  	@equipment = Equipment.new(equipment_params)
    if @equipment.save
      flash[:success] = "Equipo Creado"
      redirect_to hospital_equipment_path(current_hospital, @equipment)
    else
      render 'new'
    end
  end

  def index
  	@equipments = Equipment.where(hospital: params[:hospital_id])
  end

  def show
    @equipment = Equipment.find(params[:id])
    @subarea = Subarea.find(@equipment.subarea_id)
    @area = Area.find(@subarea.area_id)
    @contact = @area.contact
    @hospital = Hospital.find(params[:hospital_id])
  end

  def edit
    @equipment = Equipment.find(params[:id])
    @equipment_type = EquipmentType.new
    @equipment_types = EquipmentType.where(hospital_id: params[:hospital_id])
    @brand = Brand.new
    @brands = Brand.where(hospital_id: params[:hospital_id])
    @floors = floors_hospital
    @areas = current_hospital.areas
    @area = Area.new
    @subarea = Subarea.new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def update
    @equipment = Equipment.find(params[:id])
   if @equipment.update_attributes(equipment_params)
      flash[:success] = "Equipo actualizado"
      redirect_to hospital_equipment_path(current_hospital, params[:id])
   else
    render edit_hospital_equipment_path(current_hospital, params[:id])
   end
 end

  private

    def equipment_params
      params.require(:equipment).permit(:equipment_type_id, :brand_id, :hospital_id,
                                          :model, :serial_number, :image, :remote_image_url, 
                                            :lifetime, :year_manufacture, :subarea_id)
    end
  
end
