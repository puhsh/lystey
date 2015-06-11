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

ActiveRecord::Schema.define(version: 20150611190956) do

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
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "line_3"
    t.boolean  "same_as_office", default: false
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
    t.string   "slug"
  end

  add_index "agents", ["slug"], name: "index_agents_on_slug", using: :btree

  create_table "biographies", force: :cascade do |t|
    t.integer  "agent_id"
    t.string   "title"
    t.string   "short_bio"
    t.text     "long_bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "biographies", ["agent_id"], name: "index_biographies_on_agent_id", using: :btree

  create_table "brokers", force: :cascade do |t|
    t.integer  "agent_id"
    t.string   "name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "brokers", ["agent_id"], name: "index_brokers_on_agent_id", using: :btree

  create_table "certifications", force: :cascade do |t|
    t.integer  "agent_id"
    t.string   "certification_type", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "certifications", ["agent_id"], name: "index_certifications_on_agent_id", using: :btree
  add_index "certifications", ["certification_type"], name: "index_certifications_on_certification_type", using: :btree

  create_table "job_openings", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "job_title"
    t.text     "job_description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "job_openings", ["team_id"], name: "index_job_openings_on_team_id", using: :btree

  create_table "social_links", force: :cascade do |t|
    t.integer  "agent_id"
    t.string   "site"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "social_links", ["agent_id"], name: "index_social_links_on_agent_id", using: :btree

  create_table "team_members", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "full_name"
    t.text     "bio"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "team_members", ["team_id"], name: "index_team_members_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "agent_id"
    t.string   "title"
    t.text     "about"
    t.boolean  "primary_agent",  default: true
    t.boolean  "hiring",         default: false
    t.string   "hiring_title"
    t.text     "hiring_details"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "teams", ["agent_id"], name: "index_teams_on_agent_id", using: :btree

  create_table "testimonials", force: :cascade do |t|
    t.integer  "agent_id"
    t.string   "client_name"
    t.text     "text"
    t.string   "client_facebook_link"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "testimonials", ["agent_id"], name: "index_testimonials_on_agent_id", using: :btree

  create_table "themes", force: :cascade do |t|
    t.integer  "agent_id"
    t.string   "tagline"
    t.string   "background_color"
    t.string   "font_color"
    t.string   "button_color"
    t.string   "font"
    t.string   "testimonial_page_title"
    t.text     "testimonial_page_main_copy"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "buyers_guide_page_title"
    t.text     "buyers_guide_page_main_copy"
    t.string   "sellers_guide_page_title"
    t.text     "sellers_guide_page_main_copy"
  end

  add_index "themes", ["agent_id"], name: "index_themes_on_agent_id", using: :btree

  add_foreign_key "certifications", "agents"
  add_foreign_key "job_openings", "teams"
  add_foreign_key "team_members", "teams"
  add_foreign_key "teams", "agents"
  add_foreign_key "testimonials", "agents"
  add_foreign_key "themes", "agents"
end
