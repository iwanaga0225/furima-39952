class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    #@item = Item.find(params[:item_id])
    #@order = Order.new(order_params)
    #binding.pry
  end
  

  private

  #def order_params
    #params.require(:order).permit(
      #:image, :name, :content, :category_id, :status_id,
      #:delivery_charge_id, :delivery_area_id, :delivery_date_id,
      #:price
    #).merge(user_id: current_user.id)
  #end

end
