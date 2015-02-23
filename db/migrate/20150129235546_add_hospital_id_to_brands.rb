class AddHospitalIdToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :hospital_id, :int
  end
end
