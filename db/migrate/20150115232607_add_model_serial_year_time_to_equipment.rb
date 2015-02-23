class AddModelSerialYearTimeToEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :model, :string
  	add_column :equipment, :serial_number, :string
  	add_column :equipment, :year_manufacture, :int
  	add_column :equipment, :lifetime, :int 
  end
end
