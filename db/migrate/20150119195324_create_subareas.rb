class CreateSubareas < ActiveRecord::Migration
  def change
    create_table :subareas do |t|
      t.string :name
      t.integer :area_id

      t.timestamps null: false
    end
  end
end
