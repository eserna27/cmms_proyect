class Equipment < ActiveRecord::Base
	belongs_to :equipment_type
	belongs_to :brand
	belongs_to :hospital
	belongs_to :subarea
	mount_uploader :image, ImageUploader

	def brand_name
		brand.name
	end

	def subarea_name
		subarea.name
	end

	def equipment_type_name
		equipment_type.name
	end

	def cuadro_basico
		equipment_type.cuadro_basico
	end

	def umdns
		equipment_type.umdns
	end

	def gmnd
		equipment_type.gmnd
	end
end
