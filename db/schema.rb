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

ActiveRecord::Schema.define(:version => 20140316124637) do

  create_table "customers", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "surname"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "address_3"
    t.string   "town"
    t.string   "county"
    t.string   "postcode"
    t.string   "daytel"
    t.string   "hometel"
    t.boolean  "deleted"
    t.boolean  "mailbox1"
    t.boolean  "mailbox2"
    t.boolean  "mailbox3"
    t.string   "ccNo1"
    t.string   "ccNo2"
    t.string   "ccNo3"
    t.string   "ccNo4"
    t.string   "ccNo5"
    t.string   "ccDate"
    t.string   "ccstart_date"
    t.string   "ccissue_number"
    t.string   "cc_ext"
    t.boolean  "email"
    t.string   "country"
    t.string   "agendid"
    t.string   "email_address"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.string   "product_code"
    t.string   "product_name"
    t.integer  "weight"
    t.decimal  "unit_price",   :precision => 8, :scale => 2
    t.integer  "quantity"
    t.integer  "discount"
    t.decimal  "items_price",  :precision => 8, :scale => 2
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.decimal  "total_price",  :precision => 8, :scale => 2
    t.integer  "discount"
    t.date     "order_date"
    t.integer  "total_weight"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"

  create_table "packing_costs", :force => true do |t|
    t.string   "Code"
    t.string   "Description"
    t.float    "packing_cost"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "postal_costs", :force => true do |t|
    t.string   "code"
    t.float    "weight"
    t.float    "cost"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "weight"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

end
