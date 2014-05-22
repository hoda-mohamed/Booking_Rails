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

ActiveRecord::Schema.define(:version => 20140520182249) do

  create_table "hotels", :force => true do |t|
    t.string   "country"
    t.string   "city"
    t.string   "region"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reserves", :force => true do |t|
    t.integer  "user_id"
    t.integer  "hotel_id"
    t.integer  "room_id"
    t.date     "check_in"
    t.date     "check_out"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rooms", :force => true do |t|
    t.integer  "hotel_id"
    t.integer  "room_number"
    t.integer  "room_price"
    t.integer  "room_discount"
    t.string   "room_service"
    t.string   "room_image"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "rooms", ["hotel_id", "room_number"], :name => "index_rooms_on_hotel_id_and_room_number", :unique => true

  create_table "signups", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "signups", ["email"], :name => "index_signups_on_email", :unique => true

end
