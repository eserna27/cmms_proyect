class AreasController < ApplicationController
  def new
  	@area = Area.new
  end

  def subareas
  	@subarea = Subarea.new
  	 		
  	if Integer(params[:id]) != 0 
			@area = Area.find(params[:id])
			@areas = Area.where(floor: @area.floor)
			@subareas = Subarea.where(area_id: params[:id])			
		else
			@subareas = nil
		end

  	respond_to do |format|
			format.js
		end
  end

	def create
		@area = Area.new(area_params)

		respond_to do |format|
		  if @area.save
		    format.js {}
		    format.json { render json: @area, status: :created, location: new_area_path }
		  else
		    format.html { render new_area_path }
		    format.json { render json: @area.errors, status: :unprocessable_entity }
		  end		
		end
		@areas = Area.where(floor: @area.floor)
	end

  private
    def area_params
      params.require(:area).permit(:name, :description, :floor, :contact_id)
    end
end
