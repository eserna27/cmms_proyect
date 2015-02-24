class AddAreasQuantityToHospital < ActiveRecord::Migration
  def change
    add_column :hospitals, :areas_quantity, :int
  end
end
