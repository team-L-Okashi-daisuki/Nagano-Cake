class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash.now[:success] = "商品の新規登録が完了しました。"
      redirect_to admin_product_path(@product)
    else
      flash.now[:danger] = "商品の新規登録内容に不備があります。"
      render :new
    end
  end

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
     if @product.update(product_params)
       flash.now[:success] = "商品詳細の変更が完了しました。"
       redirect_to admin_product_path(@product)
     else
       flash.now[:danger] = "商品詳細の変更内容に不備があります。"
       render :edit
     end
  end

  private
  def item_params
    params.require(:product).permit(:product_image, :name, :description, :genre_id, :price, :is_active)
  end
end
