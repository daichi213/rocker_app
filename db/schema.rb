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

ActiveRecord::Schema.define(version: 20200603000548) do

  create_table "transactions", force: :cascade do |t|
    t.string "item_name"
    t.integer "item_num"
    t.integer "leaver_id"
    t.integer "receiver_id"
    t.boolean "leaver_authenticate"
    t.boolean "receiver_authenticate"
    t.date "terminated_at"
    t.decimal "leaver_point"
    t.decimal "receiver_point"
    t.text "request_content"
    t.text "baggage_content"
    t.text "transaction_message"
    t.boolean "large_scale_baggage"
    t.boolean "heavy_weight_baggage"
    t.boolean "precision_machine_baggage"
    t.boolean "dont_reverse_baggage"
    t.boolean "broken_article"
    t.boolean "refrigerated_baggage"
    t.boolean "feezed_baggage"
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
    t.string "email"
    t.string "picture"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
  end

end
