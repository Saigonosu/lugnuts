class Orderdetail < ApplicationRecord
  belongs_to :product, class_name: 'Product', foreign_key: 'productCode'
  belongs_to :order, class_name: 'Order', foreign_key: 'orderNumber'

  def total
    priceEach * quantityOrdered
  end
end
