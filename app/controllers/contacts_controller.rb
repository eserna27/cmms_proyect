class ContactsController < ApplicationController
  
  def new
  	@contact = Contact.new
  	@area = Area.find(params[:area_id])
  end

  def create
  	@contact = Contact.new(contact_params)
    if @contact.save
    	flash[:success] = "Contacto Creado"
    	area = Area.find(@contact.area_id)
      redirect_to hospital_floor_area_path(area.hospital_id, area.floor, @contact.area_id)
    else
      render 'new'
    end
  end

  def index
  	@contacts = Contact.where(hospital_id: params[:hospital_id])
  end

  def edit
  	@contact = Contact.find(params[:id])
  	@area = Area.find(params[:area_id])
  end

  def update
  	 @contact = Contact.find(params[:id])
   if @contact.update_attributes(contact_params)
      flash[:success] = "Contacto actualizado"
      area = Area.find(@contact.area_id)
      redirect_to hospital_floor_area_path(area.hospital_id, area.floor, @contact.area_id)
   else
    render  edit_hospital_area_contact_path(area.hospital_id, area, @contact)
   end
  end

  private 
  	def contact_params
  		params.require(:contact).permit(:name, :email, :phone, :area_id, :hospital_id )
  	end
end
