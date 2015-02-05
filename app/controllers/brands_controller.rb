class BrandsController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :create, :new, :destroy, :index]
  before_action :correct_hospital, only: [:show, :edit, :update, :create, :new, :destroy, :index]

  include HospitalsHelper
  
  def new
  	@brand = Brand.new
  end

  def create
		@brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.js {}
        format.json { render json: @brand, status: :created, location: new_brand_path }
      else
        format.html { render new_brand_path }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end		
    end
    @brands = Brand.where(hospital_id: current_hospital.id)
    @hospital = current_hospital
	end

  private
    def brand_params
      params.require(:brand).permit(:name, :hospital_id)
    end
end
