class ChangeNameColumnNumbreInHospital < ActiveRecord::Migration
  def change
  	rename_column :hospitals, :numbre, :number
  end
end
