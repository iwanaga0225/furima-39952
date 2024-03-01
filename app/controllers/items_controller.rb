class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to '/'
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :content, :category_id, :status_id,
      :delivery_charge_id, :delivery_area_id, :delivery_date_id,
      :price
    ).merge(user_id: current_user.id)
  end

end
