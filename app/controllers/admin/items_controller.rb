class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)  
  end
  
end
