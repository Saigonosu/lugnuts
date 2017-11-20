class Order < ApplicationRecord
  self.primary_key = 'orderNumber'
  belongs_to :customer, class_name: 'Customer', foreign_key: 'customerNumber'
  has_many :orderdetails, foreign_key: 'orderNumber'
  has_many :products, through: :orderdetails, class_name: 'Product', foreign_key: 'orderNumber'
end
