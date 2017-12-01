class AddForeignKeysToOrder < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :shipping_address, :bigint
    change_column :orders, :billing_address, :bigint
    add_foreign_key :orders, :addresses, column: :shipping_address
    add_foreign_key :orders, :addresses, column: :billing_address
  end
end
