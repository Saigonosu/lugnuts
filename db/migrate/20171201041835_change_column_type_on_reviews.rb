class ChangeColumnTypeOnReviews < ActiveRecord::Migration[5.1]
  def change
    change_column :reviews, :product_id, :string
  end
end
