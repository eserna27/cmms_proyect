class AddCuadroBasicoUmdnsToEquipmentType < ActiveRecord::Migration
  def change
  	add_column :equipment_types, :cuadro_basico, :string
  	add_column :equipment_types, :umdns, :string
  	add_column :equipment_types, :gmnd, :string
  end
end
