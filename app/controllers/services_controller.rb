class ServicesController < ApplicationController
  layout 'shop_profile_form'
  
  def index
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @services = @shop.services
  end

  def new
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @service = @shop.services.build
  end

  def create
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @service = @shop.services.build(service_params)
    if @service.save
      redirect_to shop_services_path(@shop)
    else
      render :new
    end
  end

  def edit
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @service = @shop.services.where(id: params[:id]).first
  end

  def update
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @service = @shop.services.where(id: params[:id]).first
    if @service.update_attributes(service_params)
      redirect_to @service
    else
      render :edit
    end
  end

  private

    def service_params
      params.require(:service).permit(:name, :description, :price, :duration)
    end
end
