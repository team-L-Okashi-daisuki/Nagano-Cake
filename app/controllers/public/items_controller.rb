class Public::ItemsController < ApplicationController
  def index
    @items = Product.all
  end

  def show
    @item = Product.find(params[:id])
    
  end
  
  
  private
  
  def product_params
    params.require(:product).permit(:name, :description, :price, :is_active, :product_image)  
  end
    
end
