class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_details, dependent: :destroy
  belongs_to :customer


  #enum設定
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

  def address_display
  '〒' + ship_zip_code + ' ' + ship_address + ' ' + ship_name
  end

end
