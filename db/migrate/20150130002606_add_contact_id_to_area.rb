class AddContactIdToArea < ActiveRecord::Migration
  def change
    add_column :areas, :contact_id, :int
  end
end
