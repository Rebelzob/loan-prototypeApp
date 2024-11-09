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

ActiveRecord::Schema[8.0].define(version: 2024_11_08_181920) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "date_payments", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.integer "collection_id"
    t.datetime "payment_due_date"
    t.datetime "loan_start_date"
    t.datetime "final_payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_date_payments_on_client_id"
  end

  create_table "loans", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.decimal "interest"
    t.decimal "principal"
    t.integer "paid_installments"
    t.integer "pending_installments"
    t.integer "duration"
    t.string "status"
    t.decimal "total_amount_to_pay"
    t.decimal "amount_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_loans_on_client_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "loan_id", null: false
    t.bigint "user_id", null: false
    t.datetime "payment_date"
    t.decimal "amount"
    t.decimal "interest_paid"
    t.decimal "principal_paid"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_payments_on_loan_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "phone"
    t.text "address"
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "date_payments", "users", column: "client_id"
  add_foreign_key "loans", "users", column: "client_id"
  add_foreign_key "payments", "loans"
  add_foreign_key "payments", "users"
end
