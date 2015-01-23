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
  end

  def create
  	@equipment = Equipment.new(equipment_type_id: params[:equipment_type_id], brand_id: params[:brand_id],
  															model: params[:model], serial_number: params[:serial_number],
  																year_manufacture: params[:year_manufacture], 
  																lifetime: params[:lifetime], hospital_id: current_hospital.id, 
  																	subarea_id: params[:subarea])
    if @equipment.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def index
  	@equipments = Equipment.where(hospital: params[:hospital_id])
  end
  
end
