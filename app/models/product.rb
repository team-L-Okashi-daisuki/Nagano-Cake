class Product < ApplicationRecord
  has_one_attached :product_image
  
  belongs_to :genre
  has_many :cart_items
  has_many :order_details, dependent: :destroy
  
  def with_tax_price
    (price * 1.1).floor
  end
end
