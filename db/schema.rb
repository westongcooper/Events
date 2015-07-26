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

ActiveRecord::Schema.define(version: 20150721043832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "admin",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id", using: :btree
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "name",               null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.date     "start_date"
    t.time     "start_time"
    t.date     "end_date"
    t.time     "end_time"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",          null: false
    t.string   "last_name",           null: false
    t.string   "email",               null: false
    t.string   "nickname",            null: false
    t.string   "info"
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "bio"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "venues", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",       null: false
    t.string   "info"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "venues", ["user_id"], name: "index_venues_on_user_id", using: :btree

end
