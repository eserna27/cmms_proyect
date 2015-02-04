class RemoveAreaIdFromContact < ActiveRecord::Migration
  def change
  	remove_column :contacts, :area_id
  end
end
