class Public::ShippingsController < ApplicationController

  def index
    @shipping = Shipping.new
    @customer = current_customer
    @shippings = @customer.shippings
  end

  def create

  end


   private

  def shipping_params
    params.require(:shipping).permit(:zip_code, :address, :name)
  end

end
