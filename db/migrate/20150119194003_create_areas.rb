class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.text :description
      t.integer :user_contact_id
      t.integer :floor

      t.timestamps null: false
    end
  end
end
