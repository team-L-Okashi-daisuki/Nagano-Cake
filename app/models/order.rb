class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_details, dependent: :destroy
  belongs_to :customer
  has_many :products, through: :order_details


  #enum設定
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

  def address_display
  '〒' + ship_zip_code + ' ' + ship_address + ' ' + ship_name
  end

  def temporary_information_input(current_customer_id)
    self.customer_id = current_customer_id
    self.postage = 800
    self.bill = 1
  end
  
  def order_in_zipcode_address_name(zipcode, address, name)
    self.ship_zip_code = zipcode
    self.ship_address = address
    self.ship_name = name
  end

end
