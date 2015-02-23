class AddColumnsCostAndDescriptionToPlans < ActiveRecord::Migration
  def change
  	add_column :plans, :cost, :float
  	add_column :plans, :description, :text
  end
end
