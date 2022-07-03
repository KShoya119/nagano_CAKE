class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :order_detail
  enum pay_method: { credit_card: 0, transfer: 1 }
end
