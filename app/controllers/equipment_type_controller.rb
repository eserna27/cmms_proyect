class EquipmentTypeController < ApplicationController
  include HospitalsHelper
	def new
		@equipment_type = EquipmentType.new
	end

	def create
		@equipment_type = EquipmentType.new(equipment_type_params)

    respond_to do |format|
      if @equipment_type.save
        format.js {}
        format.json { render json: @equipment_type, status: :created, location: new_equipment_path }
      else
        format.html { render new_equipment_path }
        format.json { render json: @equipment_type.errors, status: :unprocessable_entity }
      end		
    end
    @equipment_types = EquipmentType.where(hospital_id: current_hospital.id)
    @hospital = current_hospital
	end

  private
    def equipment_type_params
      params.require(:equipment_type).permit(:name, :description, :cuadro_basico, :umdns, :gmnd, :hospital_id)
    end
end
