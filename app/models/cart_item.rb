class CartItem < ApplicationRecord

  validates :quantity, numericality: { only_integer: true, greater_than: 0, less_than: 1000 }

  belongs_to :customer
  belongs_to :product

  def subtotal
    product.with_tax_price * quantity
  end
end
