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

ActiveRecord::Schema.define(version: 20150409034227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "realtor_id"
    t.string   "address_type"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city"
    t.string   "state_code"
    t.string   "zip_code"
    t.string   "county_code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "addresses", ["address_type"], name: "index_addresses_on_address_type", using: :btree
  add_index "addresses", ["realtor_id"], name: "index_addresses_on_realtor_id", using: :btree

  create_table "realtors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "license_type"
    t.string   "license_number"
    t.string   "full_name"
    t.string   "suffix"
    t.string   "license_status"
    t.datetime "original_license_date"
    t.datetime "license_expiration_date"
    t.string   "education_status"
    t.string   "mce_status"
    t.string   "designated_supervisor_flag"
    t.string   "phone_number"
    t.string   "email"
    t.string   "related_license_type"
    t.string   "related_license_number"
    t.string   "related_license_full_name"
    t.string   "related_license_suffix"
    t.datetime "relationship_start_date"
    t.string   "agency_identifier"
    t.string   "key_name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "realtors", ["license_number"], name: "index_realtors_on_license_number", using: :btree
  add_index "realtors", ["user_id"], name: "index_realtors_on_user_id", using: :btree

end
