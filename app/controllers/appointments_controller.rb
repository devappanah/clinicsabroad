class AppointmentsController < ApplicationController

 def new
  @shop = Shop.where(id: params[:shop_id]).first 
  @appointment = current_user.appointment.build
 end

 def create
  @shop = Shop.where(id: params[:shop_id]).first
  @appointment = current_user.appointments.build(appointment_params)
  @appointment.shop = @shop
  if @appointment.save
   redirect_to shop_path(@shop)
  end
 end

private
 def appointment_params
  params.require(:appointment).permit(:name, :phone, :body, :scheduled_at, :service_id)
 end

end
