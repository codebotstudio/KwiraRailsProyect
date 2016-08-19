# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160817140111) do

  create_table "buys", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "items"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "product_id"
    t.integer  "store_id"
  end

  add_index "buys", ["product_id"], name: "index_buys_on_product_id"
  add_index "buys", ["store_id"], name: "index_buys_on_store_id"
  add_index "buys", ["user_id"], name: "index_buys_on_user_id"

  create_table "devolutions", force: :cascade do |t|
    t.integer  "reason"
    t.integer  "sale_id"
    t.float    "money_returned"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "store_id"
  end

  add_index "devolutions", ["product_id"], name: "index_devolutions_on_product_id"
  add_index "devolutions", ["store_id"], name: "index_devolutions_on_store_id"
  add_index "devolutions", ["user_id"], name: "index_devolutions_on_user_id"

  create_table "has_new_products", force: :cascade do |t|
    t.integer  "buy_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "quantity"
    t.float    "buy_price"
  end

  add_index "has_new_products", ["buy_id"], name: "index_has_new_products_on_buy_id"
  add_index "has_new_products", ["product_id"], name: "index_has_new_products_on_product_id"

  create_table "has_products", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "quantity"
  end

  add_index "has_products", ["product_id"], name: "index_has_products_on_product_id"
  add_index "has_products", ["sale_id"], name: "index_has_products_on_sale_id"

  create_table "has_returned_products", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "return_id"
    t.integer  "product_id"
    t.float    "quantity"
    t.integer  "devolution_id"
  end

  add_index "has_returned_products", ["devolution_id"], name: "index_has_returned_products_on_devolution_id"
  add_index "has_returned_products", ["product_id"], name: "index_has_returned_products_on_product_id"
  add_index "has_returned_products", ["return_id"], name: "index_has_returned_products_on_return_id"

  create_table "products", force: :cascade do |t|
    t.string   "sale_title"
    t.string   "ticket_title"
    t.float    "sale_price"
    t.float    "buy_price"
    t.float    "units"
    t.boolean  "available"
    t.text     "description"
    t.string   "measurement_unit"
    t.integer  "product_type"
    t.string   "image"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "active"
    t.float    "critical"
    t.integer  "product_number"
    t.integer  "kind"
    t.integer  "store_id"
    t.float    "wholesale_price"
  end

  add_index "products", ["store_id"], name: "index_products_on_store_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "sales", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "total_price"
    t.integer  "items"
    t.boolean  "pending"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "product_id"
    t.integer  "store_id"
  end

  add_index "sales", ["product_id"], name: "index_sales_on_product_id"
  add_index "sales", ["store_id"], name: "index_sales_on_store_id"
  add_index "sales", ["user_id"], name: "index_sales_on_user_id"

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.boolean  "wholesale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "phone"
    t.string   "phone2"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "permission_level"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "schedule"
    t.integer  "store_id"
    t.boolean  "status"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["store_id"], name: "index_users_on_store_id"

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
