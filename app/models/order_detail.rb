class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def with_tax_price
    (purchase_price * 1.1).floor
  end

  def s_total
    with_tax_price * amount
  end
end
