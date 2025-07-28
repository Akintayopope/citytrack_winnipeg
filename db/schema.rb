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

ActiveRecord::Schema[8.0].define(version: 2025_07_28_003442) do
  create_table "events", force: :cascade do |t|
    t.integer "ward_id", null: false
    t.string "name"
    t.string "location"
    t.date "event_date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ward_id"], name: "index_events_on_ward_id"
  end

  create_table "expense_reports", force: :cascade do |t|
    t.integer "ward_id", null: false
    t.string "category"
    t.decimal "amount"
    t.date "report_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ward_id"], name: "index_expense_reports_on_ward_id"
  end

  create_table "service_requests", force: :cascade do |t|
    t.integer "ward_id", null: false
    t.string "category"
    t.text "description"
    t.string "status"
    t.date "request_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["ward_id"], name: "index_service_requests_on_ward_id"
  end

  create_table "wards", force: :cascade do |t|
    t.string "name"
    t.string "district"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "wards"
  add_foreign_key "expense_reports", "wards"
  add_foreign_key "service_requests", "wards"
end
