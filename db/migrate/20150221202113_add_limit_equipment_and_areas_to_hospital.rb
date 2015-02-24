class AddLimitEquipmentAndAreasToHospital < ActiveRecord::Migration
  def change
    add_column :hospitals, :limit_equipments, :int
    add_column :hospitals, :limit_areas, :int
  end
end
