class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
  end
  
  def all_destroy
    CartItem.where(customer_id: current_customer.id).destroy_all
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
