class AddIndexNicknameUser < ActiveRecord::Migration
  def change
  	add_index :users, :nickname, unique: true
  end
end
