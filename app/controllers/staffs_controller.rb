class StaffsController < ApplicationController
  layout 'shop_profile_form'
  
  def index
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @staffs = @shop.staffs
  end


  def new
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @staff = @shop.staffs.build
  end

  def create
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @staff = @shop.staffs.build(staff_params)
    if @staff.save
      redirect_to shop_staffs_path(@shop)
    else
      render :new
    end
  end

  def edit
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @staff = @shop.staffs.where(id: params[:id]).first
  end

  def update
    @shop = current_user.shops.where(id: params[:shop_id]).first
    @staff = @shop.staffs.where(id: params[:id]).first
    if @staff.update_attributes(staff_params)
      redirect_to shop_staffs_path(@shop)
    else
      render :edit
    end
  end

  private

    def staff_params
      params.require(:staff).permit(:name, :education, :skills, :avatar)
    end
end
