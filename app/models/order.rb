class Order < ApplicationRecord
  
  belongs_to :customer
  
  has_many :order_details, dependent: :destroy
  
  #enum設定
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def address_display
  '〒' + ship_zip_code + ' ' + ship_address + ' ' + ship_name
  end
  
end
