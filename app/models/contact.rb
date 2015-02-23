class Contact < ActiveRecord::Base
	belongs_to :area
	belongs_to :hospital

	def area_name
		area.name
	end

end
