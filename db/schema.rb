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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120611101536) do

  create_table "customers", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "town"
    t.string   "county"
    t.string   "country"
    t.string   "postcode"
    t.string   "telephone_number"
    t.string   "mobile_number"
    t.string   "email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.float    "total_price"
    t.float    "discount"
    t.date     "order_date"
    t.integer  "total_weight"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"

  create_table "products", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "weight"
    t.float    "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
