class Shipping < ApplicationRecord

  belongs_to :customer

  def shipping_postcode_and_address_and_name
    "〒#{self.zip_code}  #{self.address}  #{self.name}"
  end

end
