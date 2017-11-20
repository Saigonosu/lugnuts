class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.references :product, type: :string
      t.belongs_to :cart, foreign_key: true
      t.integer :quantity, default: 1
      t.belongs_to :order, type: :integer

      t.timestamps
    end
  end
end
