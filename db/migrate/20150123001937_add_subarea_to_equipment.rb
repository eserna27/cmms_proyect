class AddSubareaToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :subarea_id, :integer
  end
end
