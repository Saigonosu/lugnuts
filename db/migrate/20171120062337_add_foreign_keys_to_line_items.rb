class AddForeignKeysToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :line_items, :products, primary_key: 'productCode'
    add_foreign_key :line_items, :orders, primary_key: 'orderNumber'
  end
end
