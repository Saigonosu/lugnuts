class AddForeignKeysToLineItems < ActiveRecord::Migration[5.1]
  def change
    change_column :line_items, :product_id, :string, limit: 15
    add_foreign_key :line_items, :products, primary_key: 'productCode'
    add_foreign_key :line_items, :orders, primary_key: 'orderNumber'
  end
end
