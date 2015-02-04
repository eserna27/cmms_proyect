class RemoveContactIdFromArea < ActiveRecord::Migration
  def change
  	remove_column :areas, :contact_id
  end
end
