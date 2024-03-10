class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      #pay_item
      @item_order.save
      return redirect_to root_path
    else
      #gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:item_order).permit(
      :postal_code, :delivery_area_id, :city, :street, :building, :phone
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  #def pay_item
    #Payjp.api_key = Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    #Payjp::Charge.create(
    #  amount: order_params[:price],
    #  card: order_params[:token],
    #  currency: 'jpy'
    #)
  #end

end
