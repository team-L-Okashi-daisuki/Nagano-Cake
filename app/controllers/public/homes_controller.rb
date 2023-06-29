class Public::HomesController < ApplicationController
  def top
    @items = Product.order(created_at: :desc).limit(4)
  end

  def about
  end
end
