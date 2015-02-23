class AddBrandIdToEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :brand_id, :int
  end
end
