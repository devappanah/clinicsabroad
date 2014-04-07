class PhotosController < ApplicationController
  layout 'shop_profile_form'
  
  def index
    @shop = Shop.where(id: params[:shop_id]).first
    @photos = @shop.photos
  end

  def new
    @shop = Shop.where(id: params[:shop_id]).first
    @photo = @shop.photos.build
  end

  def create
    @shop = Shop.where(id: params[:shop_id]).first
    @photo = @shop.photos.build(photo_params)
    if @photo.save
      redirect_to shop_photos_path(@shop)
    else
      render :new
    end
  end

  def edit
    @shop = Shop.where(id: params[:shop_id]).first
    @photo = @shop.photos.where(id: params[:id]).first
  end

  def update
    @shop = Shop.where(id: params[:shop_id]).first
    @photo = @shop.photos.where(id: params[:id]).first
    if @photo.update_attributes(photo_params)
      redirect_to @photo
    else
      render :edit
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:name)
  end
end
