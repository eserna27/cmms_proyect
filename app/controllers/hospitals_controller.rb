class HospitalsController < ApplicationController
  
  def new
  	@hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      redirect_to new_plan_hospital_user_path(params[:plan_id], @hospital.id)
    else
      render 'new'
    end
  end

  private
    def hospital_params
      params.require(:hospital).permit(:name, :street, :number, :postal_code, :city,
                                            :country, :state, :nickname)
    end
end
