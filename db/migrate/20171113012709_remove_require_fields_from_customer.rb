class RemoveRequireFieldsFromCustomer < ActiveRecord::Migration[5.1]
  def change
    change_column :customers, :customerName, :string, limit: 50, null: true
    change_column :customers, :contactLastName, :string, limit: 50, null: true
    change_column :customers, :contactFirstName, :string, limit: 50, null: true
    change_column :customers, :phone, :string, limit: 50, null: true
    change_column :customers, :addressLine1, :string, limit: 50, null: true
    change_column :customers, :city, :string, limit: 50, null: true
    change_column :customers, :country, :string, limit: 50, null: true
  end
end
