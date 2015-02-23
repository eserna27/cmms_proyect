class AddHospitalIdToEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :hospital_id, :int
  end
end
