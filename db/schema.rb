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

ActiveRecord::Schema.define(version: 20160330144840) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "affiliates", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.string   "link_url"
    t.boolean  "is_enabled?"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string  "name",        null: false
    t.string  "email",       null: false
    t.string  "description"
    t.string  "website"
    t.integer "brand_id"
    t.integer "user_id"
    t.float   "percentage"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cart_count"
    t.integer  "slot_id"
    t.integer  "total"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paid_items", force: :cascade do |t|
    t.string   "brand_name"
    t.string   "product_name"
    t.integer  "brand_id"
    t.integer  "product_price"
    t.integer  "product_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "product_id",          null: false
    t.integer  "product_price",       null: false
    t.string   "product_name",        null: false
    t.string   "product_description", null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "picture"
    t.integer  "brand_id"
  end

  create_table "products_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "slots", force: :cascade do |t|
    t.string   "slot_one"
    t.string   "slot_two"
    t.string   "slot_three"
    t.string   "slot_four"
    t.string   "slot_five"
    t.string   "slot_six"
    t.string   "slot_seven"
    t.string   "slot_eight"
    t.string   "slot_nine"
    t.string   "slot_ten"
    t.integer  "cart_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "address_line_three"
    t.string   "address_line_four"
    t.string   "address_line_five"
    t.string   "phone"
    t.boolean  "is_brand?"
    t.string   "brand_name"
    t.string   "brand_email"
    t.string   "brand_website"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "login"
    t.integer  "cart_id"
    t.boolean  "admin",                  default: false
    t.string   "picture"
    t.integer  "brand_id"
    t.boolean  "is_brand?",              default: false
    t.string   "door_name_number"
    t.string   "street"
    t.string   "city"
    t.string   "borough"
    t.string   "postcode"
    t.integer  "user_detail_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["login"], name: "index_users_on_login", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
