class LocationsController < ApplicationController
  layout 'shop_profile_form'
  
  def index
    @shop = Shop.where(id: params[:shop_id]).first
    @locations = @shop.locations
  end

  def new
    @shop = Shop.where(id: params[:shop_id]).first
    @location = @shop.locations.build
  end

  def create
    @shop = Shop.where(id: params[:shop_id]).first
    @location = @shop.locations.build(location_params)
    if @location.save
      redirect_to shop_locations_path(@shop)
    else
      render :new
    end
  end

  def edit
    @shop = Shop.where(id: params[:shop_id]).first
    @location = @shop.locations.where(id: params[:id]).first
  end

  def update
    @shop = Shop.where(id: params[:shop_id]).first
    @location = @shop.locations.where(id: params[:id]).first
    if @location.update_attributes(location_params)
      redirect_to shop_locations_path @shop
    else
      render :edit
    end
  end

  private

    def location_params
      params.require(:location).permit(:lat, :lng, :address, :name, :tel, :url)
    end

end
