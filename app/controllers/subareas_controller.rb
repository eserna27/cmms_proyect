class SubareasController < ApplicationController
  def new
  	@subarea = Subarea.new
  end
  def create
		@subarea = Subarea.new(subarea_params)

		respond_to do |format|
		  if @subarea.save
		    format.js {}
		    format.json { render json: @subarea, status: :created, location: new_subarea_path }
		  else
		    format.html { render new_subarea_path }
		    format.json { render json: @subarea.errors, status: :unprocessable_entity }
		  end		
		end
		@area = Area.find(@subarea.area_id)
		@areas = Area.where(floor: @area.floor)
		@subareas = @area.subareas
		@subarea = Subarea.new
	end

  private
    def subarea_params
      params.require(:subarea).permit(:name, :area_id)
    end
end
