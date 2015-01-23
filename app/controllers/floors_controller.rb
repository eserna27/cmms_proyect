class FloorsController < ApplicationController
	
	def areas

		if Integer(params[:id]) != 0
			@areas = Area.where(floor: params[:id])
			@subarea = Subarea.new	
		else
			@areas = nil
		end

		respond_to do |format|
			format.js
		end
	end
end