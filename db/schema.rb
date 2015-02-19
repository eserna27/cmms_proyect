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

ActiveRecord::Schema.define(version: 20150212225509) do

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.integer  "hospital_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "areas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "floor"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "hospital_id"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "hospital_id"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "area_id"
    t.integer  "hospital_id"
  end

  create_table "equipment", force: true do |t|
    t.integer  "equipment_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "model"
    t.string   "serial_number"
    t.integer  "year_manufacture"
    t.integer  "lifetime"
    t.integer  "brand_id"
    t.integer  "hospital_id"
    t.integer  "subarea_id"
    t.string   "image"
  end

  create_table "equipment_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "cuadro_basico"
    t.string   "umdns"
    t.string   "gmnd"
    t.integer  "hospital_id"
  end

  create_table "hospitals", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.integer  "number"
    t.integer  "postal_code"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "nickname"
    t.integer  "floors"
  end

  add_index "hospitals", ["nickname"], name: "index_hospitals_on_nickname", unique: true

  create_table "plans", force: true do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "cost"
    t.text     "description"
    t.integer  "max_equipment"
    t.integer  "max_area"
  end

  create_table "subareas", force: true do |t|
    t.string   "name"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "nickname"
    t.integer  "hospital_id"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "user_type",       default: "normal"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true

end
