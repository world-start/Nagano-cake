class Public::ItemsController < ApplicationController
  def index
  end
  
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end
  
 

end
