class Admin::OrdersController < ApplicationController
  # def index
  #   @orders = Order.all
  # end 
  
  def edit
    @order = Order.find(params[:id])
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :order_status)
  end
end
