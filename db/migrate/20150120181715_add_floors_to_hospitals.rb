class AddFloorsToHospitals < ActiveRecord::Migration
  def change
    add_column :hospitals, :floors, :integer
  end
end
