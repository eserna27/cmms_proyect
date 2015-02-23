class AddIndexNicknameHospital < ActiveRecord::Migration
  def change
  	add_index :hospitals, :nickname, unique: true
  end
end
