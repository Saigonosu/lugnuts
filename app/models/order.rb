class Order < ApplicationRecord
  self.primary_key = 'orderNumber'
  belongs_to :customer, class_name: 'Customer', foreign_key: 'customerNumber'
  has_many :orderdetails, foreign_key: 'orderNumber'
  has_many :products, through: :orderdetails, class_name: 'Product'
  belongs_to :shipping_address
  belongs_to :billing_address

  def get_line_items_from_cart(current_user)
    current_user.cart.line_items.each_with_index do |line_item, idx|
      detail = Orderdetail.new
      detail.orderNumber = self.orderNumber
      detail.productCode = line_item.product.productCode
      detail.quantityOrdered = line_item.quantity
      detail.priceEach = line_item.product.MSRP
      detail.orderLineNumber = idx + 1
      line_item.destroy
      orderdetails << detail
    end
  end

  def total
    orderdetails.inject(0) do |sum, detail|
      sum += detail.total
    end
  end
end
