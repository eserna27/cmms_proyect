class RemoveManufactures < ActiveRecord::Migration
  def change
  	drop_table :manufacturers
  end
end
