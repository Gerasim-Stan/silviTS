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

ActiveRecord::Schema.define(version: 20150401122931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "active",      default: false
  end

  create_table "reservations", force: true do |t|
    t.string   "name",               null: false
    t.string   "surname",            null: false
    t.string   "email",              null: false
    t.string   "telephone",          null: false
    t.boolean  "attendance",         null: false
    t.string   "city_of_departure",  null: false
    t.text     "additional_message", null: false
    t.integer  "transportation_id"
    t.integer  "trip_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "reservations", ["transportation_id"], name: "index_reservations_on_transportation_id", using: :btree
  add_index "reservations", ["trip_id"], name: "index_reservations_on_trip_id", using: :btree

  create_table "transportations", force: true do |t|
    t.string   "description",                    null: false
    t.integer  "priority",                       null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "short_description", default: "", null: false
  end

  create_table "trips", force: true do |t|
    t.date     "date"
    t.time     "hour"
    t.integer  "destination_id", null: false
    t.string   "starting_point"
    t.integer  "event_id",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "trips", ["destination_id"], name: "index_trips_on_destination_id", using: :btree
  add_index "trips", ["event_id"], name: "index_trips_on_event_id", using: :btree

end
