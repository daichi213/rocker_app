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

ActiveRecord::Schema.define(version: 20200916134638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baggage_request_to_users", force: :cascade do |t|
    t.integer "required_id"
    t.integer "baggage_request_id"
    t.integer "requires_id"
    t.integer "transaction_id"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baggage_requests", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "from_time"
    t.time "to_time"
    t.text "request_content"
    t.text "baggage_content"
    t.text "transaction_message"
    t.integer "about_baggage_size_w"
    t.integer "about_baggage_size_l"
    t.integer "about_baggage_size_h"
    t.integer "leaver_start_authenticate"
    t.integer "receiver_start_authenticate"
    t.integer "leaver_end_authenticate"
    t.integer "receiver_end_authenticate"
    t.datetime "transaction_started_at"
    t.datetime "transaction_terminated_at"
    t.decimal "leaver_point"
    t.decimal "receiver_point"
    t.integer "approval_flag"
    t.integer "cancelled_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baggages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "about_baggage_size_w"
    t.integer "about_baggage_size_l"
    t.integer "about_baggage_size_h"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "solved_flag"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiry_solution_contents", force: :cascade do |t|
    t.integer "contentable_id"
    t.string "contentable_type"
    t.integer "read_flag"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "baggage_request_to_user_id"
    t.integer "read_flag"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.integer "inquiry_id"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "baggage_request_id"
    t.integer "leaver_flag"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "sex"
    t.date "birthday"
    t.string "occupation"
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "state"
    t.string "city"
    t.string "street"
    t.string "house"
    t.float "longitude"
    t.float "latitude"
    t.string "email"
    t.string "picture"
    t.integer "admin"
    t.string "password_digest"
    t.string "remember_digest"
    t.decimal "user_apparause_point"
    t.integer "amount_billed"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
