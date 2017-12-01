class ChangeColumnNamesOnOrder < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :orders, column: :shipping_address
    remove_foreign_key :orders, column: :billing_address
    rename_column :orders, :shipping_address, :shipping_address_id
    rename_column :orders, :billing_address, :billing_address_id
    add_foreign_key :orders, :addresses, column: :shipping_address_id
    add_foreign_key :orders, :addresses, column: :billing_address_id
  end
end
