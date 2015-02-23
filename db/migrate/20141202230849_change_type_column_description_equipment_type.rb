class ChangeTypeColumnDescriptionEquipmentType < ActiveRecord::Migration
  def change
  	change_column :equipment_types, :description, :text
  end
end
