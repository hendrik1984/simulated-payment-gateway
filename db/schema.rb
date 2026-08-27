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

ActiveRecord::Schema[8.1].define(version: 2026_08_27_124711) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "payment_methods", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.boolean "enabled", default: true, null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_payment_methods_on_code", unique: true
  end

  create_table "payment_transactions", force: :cascade do |t|
    t.decimal "amount", precision: 20, scale: 2, null: false
    t.datetime "created_at", null: false
    t.string "currency", null: false
    t.bigint "payment_method_id", null: false
    t.string "reference", null: false
    t.string "status", default: "pending", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_method_id"], name: "index_payment_transactions_on_payment_method_id"
    t.index ["reference"], name: "index_payment_transactions_on_reference", unique: true
  end

  add_foreign_key "payment_transactions", "payment_methods"
end
