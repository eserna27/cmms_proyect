class HospitalsController < ApplicationController
  
  def new
  	@hospital = Hospital.new
  end

  def create
    redirect_to new_plan_path
  end
end
