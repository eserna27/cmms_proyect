class AddEquipmentsQuantityToHospital < ActiveRecord::Migration
  def change
    add_column :hospitals, :equipments_quantity, :int
  end
end
