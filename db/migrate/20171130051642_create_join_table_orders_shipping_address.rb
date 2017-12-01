class CreateJoinTableOrdersShippingAddress < ActiveRecord::Migration[5.1]
  def change
    create_join_table :orders, :shipping_addresses do |t|
      # t.index [:order_id, :shipping_address_id]
      # t.index [:shipping_address_id, :order_id]
    end
  end
end
