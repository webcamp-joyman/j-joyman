class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

  def with_tax_price
    (purchase_price * 1.1).floor
  end

  def s_total
    with_tax_price * amount
  end
end
