class EquipmentController < ApplicationController
	require 'rqrcode_png'
  before_action :logged_in_user, only: [:show, :edit, :update, :create, :new, :destroy, :index]
  before_action :correct_hospital, only: [:show, :edit, :update, :create, :new, :destroy, :index]
  before_action :equipment_limit, only: [:new]

	def new
    @equipment = Equipment.new
    @equipment_type = EquipmentType.new
    @equipment_types = EquipmentType.where(hospital_id: params[:hospital_id])
    @brand = Brand.new
    @brands = Brand.where(hospital_id: params[:hospital_id])
    @floors = floors_hospital
    @areas = current_hospital.areas
    @area = Area.new
    @subarea = Subarea.new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
  	@equipment = Equipment.new(equipment_params)
    if @equipment.save
      flash[:success] = "Equipo Creado"
      redirect_to hospital_equipment_path(current_hospital, @equipment)
    else
      render 'new'
    end
  end

  def index
    if params[:subarea_id].nil?
  	   @equipments = Equipment.where(hospital: params[:hospital_id]).order('id_list ASC')
    else
      @equipments = Equipment.where(hospital: params[:hospital_id]).where(subarea_id: params[:subarea_id]).order('id_list ASC')
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
    @subarea = Subarea.find(@equipment.subarea_id)
    @area = Area.find(@subarea.area_id)
    @contact = @area.contact
    @hospital = Hospital.find(params[:hospital_id])
  end

  def edit
    @equipment = Equipment.find(params[:id])
    @equipment_type = EquipmentType.new
    @equipment_types = EquipmentType.where(hospital_id: params[:hospital_id])
    @brand = Brand.new
    @brands = Brand.where(hospital_id: params[:hospital_id])
    @floors = floors_hospital
    @areas = current_hospital.areas
    @area = Area.new
    @subarea = Subarea.new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def update
    @equipment = Equipment.find(params[:id])
   if @equipment.update_attributes(equipment_params)
      flash[:success] = "Equipo actualizado"
      redirect_to hospital_equipment_path(current_hospital, params[:id])
   else
    render edit_hospital_equipment_path(current_hospital, params[:id])
   end
 end

 def label
   @hospital = Hospital.find(params[:hospital_id])
   @equipment = @hospital.equipments.find(params[:equipment_id])
    if Rails.env.production?
      @qr = RQRCode::QRCode.new("http://sinapsis-cmms.com"+
    hospital_equipment_path(@hospital, @equipment), :size => 10).to_img.resize(200,200).to_data_url
    else
      @qr = RQRCode::QRCode.new("http://localhost:3000"+
    hospital_equipment_path(@hospital, @equipment), :size => 10).to_img.resize(200,200).to_data_url
    end
 end
  private

    def equipment_params
      @last = @hospital.equipments.order('id_list DESC').first
      if @last.nil?
        @id_list = 1
      else
        @id_list = @last.id_list + 1
      end
      params.require(:equipment).permit(:equipment_type_id, :brand_id, :hospital_id,
                                          :model, :serial_number, :image, :remote_image_url, :lifetime,
                                            :year_manufacture, :subarea_id).merge(:id_list => @id_list)
    end

    def equipment_limit
      @current_hospital = current_hospital
      if @current_hospital.equipments.count > @current_hospital.limit_equipments
        flash[:danger] = "Limite de equipos alcanzado"
        redirect_to current_user
      end
    end

end
