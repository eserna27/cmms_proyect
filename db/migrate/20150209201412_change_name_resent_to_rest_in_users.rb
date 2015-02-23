class ChangeNameResentToRestInUsers < ActiveRecord::Migration
  def change
 	rename_column :users, :resent_sent_at, :reset_sent_at
  end
end
