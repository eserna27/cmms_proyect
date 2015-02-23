class AddDefaultValueToUserType < ActiveRecord::Migration
  def up
  	change_column :users, :user_type, :string, :default => "normal"
  end

  def down
  	change_column :users, :user_type, :string
  end
end
