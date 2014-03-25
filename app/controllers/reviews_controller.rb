class ReviewsController < ApplicationController
  
  def new
    @shop = Shop.where(id: params[:shop_id]).first
    @review = @shop.reviews.build
  end

  def create
    @shop = Shop.where(id: params[:shop_id]).first
    @review = @shop.reviews.build(review_params)
    if @review.user = current_user and @review.save
      flash[:notice] = "Review added!"
      redirect_to shop_path(@shop)
    else
      flash[:notice] = "Sorry invalid review"
      redirect_to shop_path(@shop, anchor: 'new_review')
    end
  end

  def edit
    @shop = Shop.where(id: params[:shop_id]).first
    @review = @shop.reviews.where(id: params[:id]).first
  end

  def update
    @shop = Shop.where(id: params[:shop_id]).first
    @review = @shop.reviews.where(id: params[:id]).first
    if @review.update_attributes(review_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  private

    def review_params
      params.require(:review).permit(:score, :title, :body)
    end
end
