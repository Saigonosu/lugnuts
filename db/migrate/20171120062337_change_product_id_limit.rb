class ChangeProductIdLimit < ActiveRecord::Migration[5.1]
  def change
    change_column :line_items, :product_id, :string, limit: 15
  end
end
