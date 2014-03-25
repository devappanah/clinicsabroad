class MessagesController < ApplicationController

def new
  @shop = Shop.where(id: params[:shop_id]).first 
  @message = current_user.message.build
  @message.shop = @shop
end

def create
  @shop = Shop.where(id: params[:shop_id]).first
  @message = current_user.message.build(message_params)
  @message.shop = @shop
  if @message.save
    redirect_to shop_path(@shop)
  end
end

private
  def message_params
    params.require(:message).permit(:name, :phone, :body)
  end

end
