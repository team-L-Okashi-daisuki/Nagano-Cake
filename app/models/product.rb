class Product < ApplicationRecord
  has_one_attached :product_image
  
  belongs_to :genre
  has_many :cart_items
  has_many :order_details, dependent: :destroy
end
