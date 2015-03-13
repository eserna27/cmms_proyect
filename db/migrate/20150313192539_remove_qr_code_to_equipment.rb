class RemoveQrCodeToEquipment < ActiveRecord::Migration
  def change
  	remove_column :equipment, :qr_code
  end
end
