class Product < ApplicationRecord
  has_one_attached :product_image
  
  belongs_to :genre
end
