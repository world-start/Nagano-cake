class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).reverse_order
    @orders = Order.page(params[:page]).reverse_order
  end
  
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end  
end
