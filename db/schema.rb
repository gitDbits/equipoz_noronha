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

ActiveRecord::Schema.define(version: 20161205152429) do

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "delivery_address"
    t.string   "rental_period"
    t.string   "contact"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "customer_id"
    t.string   "number"
    t.float    "discount"
    t.float    "total_amount"
    t.index ["customer_id"], name: "index_contracts_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "customer_type"
    t.string   "document"
    t.string   "fiscal_number"
    t.string   "legal_name"
    t.string   "contact_name"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "address"
  end

  create_table "delivery_receipts", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "contract_id"
    t.index ["contract_id"], name: "index_delivery_receipts_on_contract_id"
  end

  create_table "delivery_returns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "contract_id"
    t.string   "document"
    t.index ["contract_id"], name: "index_delivery_returns_on_contract_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "category"
    t.string   "serial_number"
    t.date     "acquisition_date"
    t.decimal  "replacement_value"
    t.integer  "usage_limit"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "contract_id"
    t.string   "name"
    t.index ["contract_id"], name: "index_equipment_on_contract_id"
  end

  create_table "rented_equipments", force: :cascade do |t|
    t.integer  "contract_id"
    t.integer  "equipment_id"
    t.date     "delivery_date"
    t.date     "return_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["contract_id"], name: "index_rented_equipments_on_contract_id"
    t.index ["equipment_id"], name: "index_rented_equipments_on_equipment_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
