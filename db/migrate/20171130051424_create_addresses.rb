class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :address_line1
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
