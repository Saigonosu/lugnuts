# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171120062337) do

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", primary_key: "customerNumber", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "customerName", limit: 50, null: false
    t.string "contactLastName", limit: 50, null: false
    t.string "contactFirstName", limit: 50, null: false
    t.string "phone", limit: 50, null: false
    t.string "addressLine1", limit: 50, null: false
    t.string "addressLine2", limit: 50
    t.string "city", limit: 50, null: false
    t.string "state", limit: 50
    t.string "postalCode", limit: 15
    t.string "country", limit: 50, null: false
    t.integer "salesRepEmployeeNumber"
    t.decimal "creditLimit", precision: 10, scale: 2
    t.bigint "user_id"
    t.index ["salesRepEmployeeNumber"], name: "salesRepEmployeeNumber"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "employees", primary_key: "employeeNumber", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "lastName", limit: 50, null: false
    t.string "firstName", limit: 50, null: false
    t.string "extension", limit: 10, null: false
    t.string "email", limit: 100, null: false
    t.string "officeCode", limit: 10, null: false
    t.integer "reportsTo"
    t.string "jobTitle", limit: 50, null: false
    t.index ["officeCode"], name: "officeCode"
    t.index ["reportsTo"], name: "reportsTo"
  end

  create_table "line_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "product_id", limit: 15
    t.bigint "cart_id"
    t.integer "quantity", default: 1
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "offices", primary_key: "officeCode", id: :string, limit: 10, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "city", limit: 50, null: false
    t.string "phone", limit: 50, null: false
    t.string "addressLine1", limit: 50, null: false
    t.string "addressLine2", limit: 50
    t.string "state", limit: 50
    t.string "country", limit: 50, null: false
    t.string "postalCode", limit: 15, null: false
    t.string "territory", limit: 10, null: false
  end

  create_table "orderdetails", primary_key: ["orderNumber", "productCode"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "orderNumber", null: false
    t.string "productCode", limit: 15, null: false
    t.integer "quantityOrdered", null: false
    t.decimal "priceEach", precision: 10, scale: 2, null: false
    t.integer "orderLineNumber", limit: 2, null: false
    t.index ["productCode"], name: "productCode"
  end

  create_table "orders", primary_key: "orderNumber", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "orderDate", null: false
    t.date "requiredDate", null: false
    t.date "shippedDate"
    t.string "status", limit: 15, null: false
    t.text "comments"
    t.integer "customerNumber", null: false
    t.index ["customerNumber"], name: "customerNumber"
  end

  create_table "payments", primary_key: ["customerNumber", "checkNumber"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "customerNumber", null: false
    t.string "checkNumber", limit: 50, null: false
    t.date "paymentDate", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
  end

  create_table "productlines", primary_key: "productLine", id: :string, limit: 50, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "textDescription", limit: 4000
    t.text "htmlDescription", limit: 16777215
    t.binary "image", limit: 16777215
  end

  create_table "products", primary_key: "productCode", id: :string, limit: 15, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "productName", limit: 70, null: false
    t.string "productLine", limit: 50, null: false
    t.string "productScale", limit: 10, null: false
    t.string "productVendor", limit: 50, null: false
    t.text "productDescription", null: false
    t.integer "quantityInStock", limit: 2, null: false
    t.decimal "buyPrice", precision: 10, scale: 2, null: false
    t.decimal "MSRP", precision: 10, scale: 2, null: false
    t.index ["productLine"], name: "productLine"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "employees", column: "salesRepEmployeeNumber", primary_key: "employeeNumber", name: "customers_ibfk_1"
  add_foreign_key "customers", "users"
  add_foreign_key "employees", "employees", column: "reportsTo", primary_key: "employeeNumber", name: "employees_ibfk_1"
  add_foreign_key "employees", "offices", column: "officeCode", primary_key: "officeCode", name: "employees_ibfk_2"
  add_foreign_key "line_items", "carts"
  add_foreign_key "orderdetails", "orders", column: "orderNumber", primary_key: "orderNumber", name: "orderdetails_ibfk_1"
  add_foreign_key "orderdetails", "products", column: "productCode", primary_key: "productCode", name: "orderdetails_ibfk_2"
  add_foreign_key "orders", "customers", column: "customerNumber", primary_key: "customerNumber", name: "orders_ibfk_1"
  add_foreign_key "payments", "customers", column: "customerNumber", primary_key: "customerNumber", name: "payments_ibfk_1"
  add_foreign_key "products", "productlines", column: "productLine", primary_key: "productLine", name: "products_ibfk_1"
end
