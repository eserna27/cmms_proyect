class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :plan_id
      t.integer :hospital_id

      t.timestamps null: false
    end
  end
end
