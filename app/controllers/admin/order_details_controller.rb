class Admin::OrderDetailsController < ApplicationController

  def update
  @order_detail = OrderDetail.find(params[:order_detail][:order_detail_id])
  @order = @order_detail.order if @order_detail.order # 関連付けが存在する場合にのみ@orderを設定する

  if @order_detail.update(order_detail_status_params)
    if @order && @order.order_details.pluck(:status).include?("製作中")
      @order.status = 2
      @order.save
    elsif @order && @order.order_details.pluck(:status).all? { |status| status == "製作完了" }
      @order.status = 3
      @order.save
    end

    flash[:success] = "制作ステータスを変更しました。"
    redirect_to admin_order_path(@order)
  else
    redirect_back(fallback_location: root_path)
  end
end

  private

  def order_detail_status_params
    params.require(:order_detail).permit(:status)

  end
end
