class AddIdIndexToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :id_list, :int
  end
end
