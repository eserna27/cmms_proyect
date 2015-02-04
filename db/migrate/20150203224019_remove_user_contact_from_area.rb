class RemoveUserContactFromArea < ActiveRecord::Migration
  def change
  	remove_column :areas, :user_contact_id
  end
end
