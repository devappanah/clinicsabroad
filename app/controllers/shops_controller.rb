class ShopsController < ApplicationController
  before_filter :authenticate_admin_user!, except: [:index, :show]

  layout 'shop_profile_form', only: [:edit]
  # needs specific user during create, edit except during index or show
  # current_user.shops. build or where is to specify that user is needed

  def index
    @shops = Shop.by_city(params[:city])
                 .by_service(params[:service])
                 .by_category(params[:category_id])
  end

  def show
    @shop = Shop.where(id: params[:id]).first
  end

  def new
    @shop = Shop.new
    1.times { @shop.locations.build }
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to edit_shop_path(@shop)
    else
      render :new
    end
  end

  def edit
    @shop = Shop.where(id: params[:id]).first
  end

  def update
    @shop = Shop.where(id: params[:id]).first
    if @shop.update_attributes(shop_params)
      redirect_to edit_shop_path(@shop)
    else
      render :edit
    end

  end

  def destroy
    @shop = Shop.where(id: params[:id]).first
    @shop.destroy
    redirect_to shops_path
  end

private
  def shop_params
    params.require(:shop).permit(:name, :description, :highlights, 
                                 :hours_operation, :payment_methods, :insurance_terms, 
                                 :certifications, :additional_services, :years_business, 
                                 category_ids: [], locations_attributes: [:id, :address])
  end
end
