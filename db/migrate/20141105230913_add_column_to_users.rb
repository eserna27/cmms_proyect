class AddColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :nickname
  end
end
