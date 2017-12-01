class AddReferenceOrderBillingAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :billing_address, :integer, :references => 'addresses'
  end
end
