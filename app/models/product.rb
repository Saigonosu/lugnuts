class Product < ApplicationRecord
  self.primary_key = "productCode"
  belongs_to :productlines, class_name: 'Productline', foreign_key: 'productLine'
  has_many :orderdetails, foreign_key: 'productCode'
  has_many :orders, through: :orderdetails, class_name: 'Order'
  has_many :line_items
end
