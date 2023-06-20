class Public::OrdersController < ApplicationController
  def new
  end

  def create
  end

  def index

  end

  def show
  end

  def confirm
    
  @order = Order.new(order_params)
  binding.pry
    
  end

  def thanks
  end
  
  private
  
    def order_params
      params.require(:order).permit(:payment_method)
    end
  
end
