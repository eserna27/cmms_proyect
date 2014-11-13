class AddColumnNicknameHospital < ActiveRecord::Migration
  def change
  	add_column :hospitals, :nickname, :string
  end
end
