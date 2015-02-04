class SubareasController < ApplicationController
  
  def new
  	@subarea = Subarea.new
  	@area = Area.find(params[:area_id])
  end
  
  def create
		@subarea = Subarea.new(subarea_params)

		respond_to do |format|
		  if @subarea.save
		    format.js {}
		    @area = Area.find(@subarea.area_id)
		    format.html { redirect_to hospital_floor_area_path(@area.hospital_id, @area.floor, @area)}
		  else
		    format.html { render new_subarea_path }
		    format.js {}
		  end		
		end
		@area = Area.find(@subarea.area_id)
		@areas = Area.where(floor: @area.floor)
		@subareas = @area.subareas
		@subarea = Subarea.new
	end

	def edit
		@subarea = Subarea.find(params[:id])
  	@area = Area.find(params[:area_id])
	end

	def update
  	@subarea = Subarea.find(params[:id])
  	@area = Area.find(@subarea.area_id)
   if @subarea.update_attributes(subarea_params)
      flash[:success] = "Subárea actualizada"
      redirect_to hospital_floor_area_path(@area.hospital_id, @area.floor, @area)
   else
    render  edit_hospital_floor_area_path(@area.hospital_id, @area.floor, @area)
   end
	end

	def destroy
    @subarea = Subarea.find(params[:id])
    @area = Area.find(@subarea.area_id)
    @subarea.destroy
    flash[:warning] = "Subarea Eliminada"
    redirect_to  hospital_floor_area_path(@area.hospital_id, @area.floor, @area)
  end

  private
    def subarea_params
      params.require(:subarea).permit(:name, :area_id)
    end
end
