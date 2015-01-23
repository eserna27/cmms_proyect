class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.integer :equipment_type_id

      t.timestamps null: false
    end
  end
end
