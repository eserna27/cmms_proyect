class AddMaxEquipmentAndMaxAreaToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :max_equipment, :int
    add_column :plans, :max_area, :int
  end
end
