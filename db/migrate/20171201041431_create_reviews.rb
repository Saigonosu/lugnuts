class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :product
      t.string :review
      t.integer :stars

      t.timestamps
    end
  end
end
