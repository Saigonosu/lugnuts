class CreateJoinTableOrdersBillingAddress < ActiveRecord::Migration[5.1]
  def change
    create_join_table :orders, :billing_addresses do |t|
      # t.index [:order_id, :billing_address_id]
      # t.index [:billing_address_id, :order_id]
    end
  end
end
