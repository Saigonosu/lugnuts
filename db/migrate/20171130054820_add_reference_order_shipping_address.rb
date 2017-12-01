class AddReferenceOrderShippingAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :shipping_address, :integer, :references => 'addresses'
  end
end
