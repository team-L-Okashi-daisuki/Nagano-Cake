class Order < ApplicationRecord
  
  belongs_to :customer
  
  has_many :order_details, dependent: :destroy
  
  validates :customer_id, presence: :true
  validates :ship_name, presence: :true
  validates :ship_address, presence: :true
  validates :ship_zip_code, presence: :true
  validates :postage, presence: :true
  validates :bill, presence: :true
  
  def address_display
  '〒' + ship_zip_code + ' ' + ship_address + ' ' + ship_name
  end
  
end
