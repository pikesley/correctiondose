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

ActiveRecord::Schema.define(version: 20160221155315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blood_pressures", force: :cascade do |t|
    t.datetime "datetime"
    t.string   "reading"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carbohydrate_intakes", force: :cascade do |t|
    t.datetime "datetime"
    t.float    "weight"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "generics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "glucose_measurements", force: :cascade do |t|
    t.datetime "datetime"
    t.float    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "glycated_haemoglobins", force: :cascade do |t|
    t.datetime "datetime"
    t.float    "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_events", force: :cascade do |t|
    t.datetime "datetime"
    t.string   "insulin"
    t.float    "dose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "physical_exercises", force: :cascade do |t|
    t.datetime "datetime"
    t.float    "duration"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
