class AddToManufacturerContactData < ActiveRecord::Migration
  def change
    add_column :manufacturers, :contact_name, :string
    add_column :manufacturers, :contact_email, :string
    add_column :manufacturers, :contact_telephone, :string
  end
end
