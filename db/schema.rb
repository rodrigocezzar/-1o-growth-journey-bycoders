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

ActiveRecord::Schema.define(version: 2021_10_10_221029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "negociation_values", force: :cascade do |t|
    t.decimal "max_value", default: "0.0"
    t.decimal "min_value", default: "0.0"
    t.decimal "comission", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.boolean "admin"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "status"
    t.decimal "value", default: "0.0"
    t.decimal "cost_index", default: "0.0"
    t.decimal "factory_cost", default: "0.0"
    t.string "form_payment"
    t.decimal "minimal_sale_value", default: "0.0"
    t.decimal "reserve_cost", default: "0.0"
    t.decimal "credit_card_fee", default: "0.0"
    t.integer "installments"
    t.decimal "net_value", default: "0.0"
    t.decimal "discount", default: "0.0"
    t.decimal "tax", default: "0.0"
    t.decimal "manager_commission", default: "0.0"
    t.decimal "assembler_commission", default: "0.0"
    t.decimal "seller_commission", default: "0.0"
    t.decimal "finder_commission", default: "0.0"
    t.decimal "shipping_cost", default: "0.0"
    t.decimal "minimal_percent", default: "0.0"
    t.decimal "result", default: "0.0"
    t.decimal "suggested_price_manufactures", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_quotations_on_user_id"
  end

  create_table "setups", force: :cascade do |t|
    t.decimal "manager_commission", default: "0.0"
    t.decimal "assembler_commission", default: "0.0"
    t.decimal "factory_cost", default: "0.0"
    t.decimal "seller_commission", default: "0.0"
    t.decimal "credit_card_fee", default: "0.0"
    t.decimal "shipping_cost", default: "0.0"
    t.decimal "finder_commission", default: "0.0"
    t.decimal "reserve_cost", default: "0.0"
    t.decimal "tax", default: "0.0"
    t.decimal "negotiated_value", default: "0.0"
    t.decimal "discount", default: "0.0"
    t.decimal "suggested_price_manufactures", default: "0.0"
    t.decimal "minimal_percent", default: "0.0"
    t.decimal "result", default: "0.0"
    t.decimal "cost_index", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.json "tokens"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "quotations", "users"
end
