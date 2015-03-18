class AddQrCodeToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :qr_code, :string
  end
end
