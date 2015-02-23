class AddHospitalIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :hospital_id, :int
  end
end
