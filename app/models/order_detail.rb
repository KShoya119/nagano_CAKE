class OrderDetail < ApplicationRecord
  has_many :items
  has_many :orders
end
