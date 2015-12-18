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

ActiveRecord::Schema.define(version: 20151218201710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "price"
    t.boolean  "nuts"
    t.boolean  "shellfish"
    t.boolean  "dairy"
    t.boolean  "vegetarian"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.integer  "party_id"
    t.boolean  "nuts"
    t.boolean  "shellfish"
    t.boolean  "dairy"
    t.boolean  "vegetarian"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guests", ["party_id"], name: "index_guests_on_party_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "party_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["dish_id"], name: "index_orders_on_dish_id", using: :btree
  add_index "orders", ["party_id"], name: "index_orders_on_party_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "parties", force: :cascade do |t|
    t.string   "reservation"
    t.integer  "size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tabletops", force: :cascade do |t|
    t.boolean  "occupied"
    t.integer  "capacity"
    t.string   "status"
    t.integer  "party_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tabletops", ["party_id"], name: "index_tabletops_on_party_id", using: :btree
  add_index "tabletops", ["user_id"], name: "index_tabletops_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "position"
    t.integer  "pin"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "guests", "parties"
  add_foreign_key "orders", "dishes"
  add_foreign_key "orders", "parties"
  add_foreign_key "orders", "users"
  add_foreign_key "tabletops", "parties"
  add_foreign_key "tabletops", "users"
end
