class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_details = OrderDetail.where(id: @order)
    @product_status = @order.order_details.pluck(:product_is_active)
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(id: @order)
    if @order.update(status_params)
      if @order.status.include?("入金確認")
         @order_details.update(status: 1)
      end
      flash[:success] = "制作ステータスを変更しました。"
      redirect_to admin_order_path(@order)
    else
      render "show"
    end
  end

  private

  def status_params
    params.require(:order).permit(:status)
  end
end