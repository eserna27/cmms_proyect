class Subarea < ActiveRecord::Base
	belongs_to :area
	has_many :equipments

	def area_name
		area.name
	end
end
