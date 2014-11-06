class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :street
      t.integer :numbre
      t.integer :postal_code
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
