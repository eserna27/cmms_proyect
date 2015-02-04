class FloorsController < ApplicationController
	include HospitalsHelper

	def areas_select
		if Integer(params[:id]) != 0
			@areas = Area.where(floor: params[:id]).where(hospital_id: params[:hospital_id])
			@subarea = Subarea.new	
		else
			@areas = nil
		end

		respond_to do |format|
			format.js
		end
	end

	def index
		@floors = floors_hospital
		@hospital = current_hospital
	end
end