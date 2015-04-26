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

ActiveRecord::Schema.define(version: 20150426030613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "agent_id"
    t.string   "address_type"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["address_type"], name: "index_addresses_on_address_type", using: :btree
  add_index "addresses", ["agent_id"], name: "index_addresses_on_agent_id", using: :btree

  create_table "agents", force: :cascade do |t|
    t.boolean  "registered",     default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "license_number"
    t.string   "license_type"
    t.string   "license_county"
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "email"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "social_links", force: :cascade do |t|
    t.integer  "agent_id"
    t.string   "site"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "social_links", ["agent_id"], name: "index_social_links_on_agent_id", using: :btree

end
