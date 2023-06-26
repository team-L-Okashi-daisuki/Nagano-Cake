class Public::HomesController < ApplicationController
  def top
    @items = Product.all
  end

  def about
  end
end
