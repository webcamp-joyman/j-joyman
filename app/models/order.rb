class Order < ApplicationRecord
  belongs_to :member
  has_many :order_details

    enum method_payment: { credit_card: 0, transfer: 1 }
    enum status: { wait_payment: 0, payment_confirm: 1, production: 2, ready_ship: 3, finish_ship: 4 }
end
