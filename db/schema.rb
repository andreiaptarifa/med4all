# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_10_215148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donations", force: :cascade do |t|
    t.date "expiry_date"
    t.integer "units"
    t.bigint "user_id", null: false
    t.bigint "pharmacy_id", null: false
    t.bigint "medication_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medication_id"], name: "index_donations_on_medication_id"
    t.index ["pharmacy_id"], name: "index_donations_on_pharmacy_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "medication_orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "medication_id", null: false
    t.bigint "pharmacy_id", null: false
    t.integer "units"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medication_id"], name: "index_medication_orders_on_medication_id"
    t.index ["pharmacy_id"], name: "index_medication_orders_on_pharmacy_id"
    t.index ["user_id"], name: "index_medication_orders_on_user_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "active_substance"
    t.string "commercial_name"
    t.string "lab"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "concentration"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "pharmacy_address"
    t.string "pharmacy_name"
    t.bigint "medication_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medication_id"], name: "index_pharmacies_on_medication_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "donations", "medications"
  add_foreign_key "donations", "pharmacies"
  add_foreign_key "donations", "users"
  add_foreign_key "medication_orders", "medications"
  add_foreign_key "medication_orders", "pharmacies"
  add_foreign_key "medication_orders", "users"
  add_foreign_key "pharmacies", "medications"
  add_foreign_key "prescriptions", "users"
end
