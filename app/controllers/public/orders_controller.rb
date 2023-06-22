class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
     cart_items = current_customer.cart_items
    if cart_items.present?
      @order = Order.new
      @shipping = Shipping.all
    else
      flash[:notice] = "カートが空です"
      redirect_to request.referer
    end
  end

  def confirm
    @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    customer = current_customer
    address_option = params[:order][:address_option].to_i

    @order.payment_method = params[:order][:payment_method].to_i
    @order.temporary_information_input(customer.id)

    if address_option == 0
      @order.order_in_postcode_address_name(customer.zip_code, customer.address, customer.last_name)
    elsif address_option == 1
      shipping = Shipping.find(params[:order][:address])
      @order.order_in_postcode_address_name(shipping.ship_zip_code, shipping.ship_address, shipping.ship_name)
    elsif address_option == 2
      @order.order_in_postcode_address_name(params[:order][:ship_zip_code], params[:order][:ship_address], params[:order][:ship_name])
    else

    end

    unless @order.valid?
      flash[:danger] = "配送先情報がありません<br>・#{@order.errors.full_messages.join('<br>・')}"
      p @order.errors.full_messages
      redirect_back(fallback_location: root_path)
    end

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    if @order.save
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price_including_tax = change_price_excluding_tax(cart_item.item.price_excluding_tax)
        order_detail.production_status = 0
        if order_detail.save
          @cart_items.destroy_all
        end
      end
      redirect_to orders_thanks_path
    else

    end
  end

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(5).order(created_at: :DESC)
  end

  def show
    @order = Order.find(params[:id])
  end

  def thanks
  end

  private

    def order_params
      params.require(:order).permit(:ship_name, :ship_zip_code, :ship_address, :bill, :payment_method)
    end

end
