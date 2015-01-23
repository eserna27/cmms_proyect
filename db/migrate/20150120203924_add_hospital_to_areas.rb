class AddHospitalToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :hospital_id, :integer
  end
end
