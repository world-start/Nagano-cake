class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
    @sum = 800
  end

  def update
  end

  def remove
  end

  def destroy_all
  end

  def create
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
