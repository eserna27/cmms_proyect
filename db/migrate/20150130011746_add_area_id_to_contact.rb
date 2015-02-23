class AddAreaIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :area_id, :int
  end
end
