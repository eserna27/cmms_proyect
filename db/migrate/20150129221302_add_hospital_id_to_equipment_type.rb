class AddHospitalIdToEquipmentType < ActiveRecord::Migration
  def change
  	add_column :equipment_types, :hospital_id, :int
  end
end
