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

ActiveRecord::Schema.define(version: 20140530215640) do

  create_table "addresses", force: true do |t|
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carriers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_types", force: true do |t|
    t.integer  "carrier_id"
    t.string   "delivery_type"
    t.string   "tracking_number_format"
    t.string   "tracking_number_checksum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages", force: true do |t|
    t.string   "sender_name"
    t.date     "send_date"
    t.text     "notes"
    t.integer  "carrier_id"
    t.string   "tracking_number"
    t.integer  "delivery_type_id"
    t.integer  "user_id"
    t.integer  "tracking_number_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracking_details", force: true do |t|
    t.integer  "package_id"
    t.datetime "activity_datetime"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "activity_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracking_number_statuses", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "status"
    t.date     "status_date"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
