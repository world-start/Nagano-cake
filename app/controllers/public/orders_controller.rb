class Public::OrdersController < ApplicationController
  
  def new
   @order = Order.new
  # @order.addresses.build
  end
  
  
  def confirm
      @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      #自身の住所をcreateアクションに送ってあげる
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      #登録先住所から選ぶ→Addressモデルからどの住所にするか選ぶ
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order = Order.new(order_params)
    end
    
      @cart_items = current_customer.cart_items
      @cart_item = 0
      @cart_items.each do |cart_item|
        @cart_item += cart_item.subtotal
      end
      
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_thanks_path 
  end
  
  def thanks
  end
  
  
  def index
  end
  
  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment, :select_address)
  end
end
