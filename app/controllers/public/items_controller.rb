class Public::ItemsController < ApplicationController
  def index
    @items = Product.page(params[:page]).per(8)
  end

  def show
    @item = Product.find(params[:id])
    @cart_item = CartItem.new
  end
  
  
  private
  
  def product_params
    params.require(:product).permit(:name, :description, :price, :is_active, :product_image)  
  end
    
end
