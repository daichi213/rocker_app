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

ActiveRecord::Schema.define(version: 20200902123738) do

  create_table "baggage_request_to_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "required_id"
    t.integer "baggage_request_id"
    t.integer "requires_id"
    t.integer "transaction_id"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baggage_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.datetime "from_time"
    t.datetime "to_time"
    t.text "request_content"
    t.text "baggage_content"
    t.text "transaction_message"
    t.integer "about_baggage_size_w"
    t.integer "about_baggage_size_l"
    t.integer "about_baggage_size_h"
    t.integer "approval_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baggages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "about_baggage_size_w"
    t.integer "about_baggage_size_l"
    t.integer "about_baggage_size_h"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.integer "solved_flag"
    t.integer "read_flag"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiry_solution_contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "inquiry_id"
    t.integer "solution_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "baggage_request_to_user_id"
    t.integer "read_flag"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.decimal "latitude", precision: 10
    t.decimal "longitude", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.integer "inquiry_id"
    t.integer "read_flag"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "leaver_authenticate"
    t.integer "receiver_authenticate"
    t.datetime "started_at"
    t.datetime "terminated_at"
    t.decimal "leaver_point", precision: 10
    t.decimal "receiver_point", precision: 10
    t.integer "baggage_request_id"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.float "longitude", limit: 24
    t.float "latitude", limit: 24
    t.string "email"
    t.string "picture"
    t.integer "admin"
    t.string "password_digest"
    t.string "remember_digest"
    t.decimal "user_apparause_point", precision: 10
    t.integer "amount_billed"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
