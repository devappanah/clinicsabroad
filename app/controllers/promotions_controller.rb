class PromotionsController < ApplicationController
  layout 'shop_profile_form'
  
  def index
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @promotions = @shop.promotions
  end


  def new
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @promotion = @shop.promotions.build
  end

  def create
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @promotion = @shop.promotions.build(promotion_params)
    if @promotion.save
      redirect_to shop_promotions_path(@shop)
    else
      render :new
    end
  end

  def edit
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @promotion = @shop.promotions.where(id: params[:id]).first
  end

  def update
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @promotion = @shop.promotions.where(id: params[:id]).first
    if @promotion.update_attributes(promotion_params)
      redirect_to shop_promotions_path(@shop)
    else
      render :edit
    end
  end

  private

    def promotion_params
      params.require(:promotion).permit(:title, :description, :exp_date, :avatar)
    end
end
