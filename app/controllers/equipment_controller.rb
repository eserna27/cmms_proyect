class EquipmentController < ApplicationController
	include HospitalsHelper

	def new
    @equipment = Equipment.new
    @equipment_type = EquipmentType.new
    @equipment_types = EquipmentType.all
    @brand = Brand.new
    @brands = Brand.all
    @floors = floors_hospital
    @areas = current_hospital.areas
    @area = Area.new
    @subarea = Subarea.new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
  	@equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to hospital_equipment_index_path(@equipment.hospital_id)
    else
      render 'new'
    end
  end

  def index
  	@equipments = Equipment.where(hospital: params[:hospital_id])
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  private

    def equipment_params
      params.require(:equipment).permit(:equipment_type_id, :brand_id, :hospital_id,
                                          :model, :serial_number, :image, :remote_image_url, 
                                            :lifetime, :year_manufacture, :subarea_id)
    end
  
end
