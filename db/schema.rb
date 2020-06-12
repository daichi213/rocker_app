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

ActiveRecord::Schema.define(version: 20200610064726) do

  create_table "baggages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "about_baggage_size_w"
    t.integer "about_baggage_size_l"
    t.integer "about_baggage_size_h"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "leaver_id"
    t.integer "required_id"
    t.integer "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "item_name"
    t.integer "item_num"
    t.integer "leaver_id"
    t.integer "receiver_id"
    t.integer "leaver_authenticate"
    t.integer "receiver_authenticate"
    t.date "terminated_at"
    t.decimal "leaver_point"
    t.decimal "receiver_point"
    t.text "request_content"
    t.text "baggage_content"
    t.text "transaction_message"
    t.integer "about_baggage_size_w"
    t.integer "about_baggage_size_l"
    t.integer "about_baggage_size_h"
    t.date "from_day"
    t.time "from_time"
    t.date "to_day"
    t.time "to_time"
    t.integer "amount_billed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "sex"
    t.date "birthday"
    t.string "occupation"
    t.string "address"
    t.string "email"
    t.string "picture"
    t.integer "admin"
    t.string "password_digest"
    t.string "remember_digest"
    t.decimal "user_apparause_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
