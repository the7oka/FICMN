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

ActiveRecord::Schema.define(version: 20170726185527) do

  create_table "cats", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_link"
    t.text "description", default: "Please put description here"
  end

  create_table "contactmes", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.integer "subcat_id"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcat_id"], name: "index_contactmes_on_subcat_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "iso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "query_id"
    t.text "details"
    t.integer "amount"
    t.boolean "paid", default: false
    t.time "purchased_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["query_id"], name: "index_invoices_on_query_id"
  end

  create_table "order_transactions", force: :cascade do |t|
    t.integer "order_id"
    t.string "action"
    t.integer "amount"
    t.boolean "success"
    t.string "authorization"
    t.string "message"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_transactions_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "invoice_id"
    t.string "ip_address"
    t.string "first_name"
    t.string "last_name"
    t.string "card_type"
    t.date "card_expires_on"
    t.string "express_token"
    t.string "express_payer_id"
    t.string "billing_address"
    t.string "billing_address_2"
    t.string "country"
    t.string "state"
    t.string "county"
    t.string "city"
    t.string "email"
    t.string "zipcode"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_amount"
    t.string "business_name"
    t.string "policy_num"
    t.integer "subcat_id"
    t.integer "user_id"
    t.index ["invoice_id"], name: "index_orders_on_invoice_id"
    t.index ["subcat_id"], name: "index_orders_on_subcat_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.string "text1"
    t.string "text2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "head"
  end

  create_table "payment_forms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subcat_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "business_name"
    t.string "policy_num"
    t.string "address_one"
    t.string "address_two"
    t.integer "state_id"
    t.string "city"
    t.string "zip"
    t.string "phone"
    t.string "email"
    t.date "birth"
    t.string "status"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_payment_forms_on_state_id"
    t.index ["subcat_id"], name: "index_payment_forms_on_subcat_id"
    t.index ["user_id"], name: "index_payment_forms_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "queries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subcat_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "address_one"
    t.string "address_two"
    t.integer "state_id"
    t.string "city"
    t.string "zip"
    t.string "phone"
    t.string "email"
    t.date "birth"
    t.string "status"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "business_name"
    t.index ["state_id"], name: "index_queries_on_state_id"
    t.index ["subcat_id"], name: "index_queries_on_subcat_id"
    t.index ["user_id"], name: "index_queries_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.integer "country_id"
    t.string "name"
    t.string "iso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "subcats", force: :cascade do |t|
    t.integer "cat_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "business", default: false
    t.index ["cat_id"], name: "index_subcats_on_cat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
