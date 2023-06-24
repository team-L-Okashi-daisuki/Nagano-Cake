class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end
  
  def update
  end

  def destroy
  end
  
  def all_destroy
  end
  
  def create
    @cart_item_check = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:product_id])
    if @cart_item_check
      @cart_item_check.quantity += params[:cart_item][:quantity].to_i
      @cart_item_check.save
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
  end
  
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
  end
  
end
