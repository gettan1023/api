# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_25_050511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jugyos", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "university_id", null: false
    t.integer "day"
    t.integer "period"
    t.string "teacher_name"
    t.date "date", null: false
    t.datetime "closing_date", null: false
    t.bigint "admin_user_id", null: false
    t.boolean "is_closed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_user_id"], name: "index_jugyos_on_admin_user_id"
    t.index ["university_id"], name: "index_jugyos_on_university_id"
  end

  create_table "room_messages", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "user_id", null: false
    t.text "message"
    t.string "image"
    t.datetime "send_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_room_messages_on_room_id"
    t.index ["user_id"], name: "index_room_messages_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "uuid", null: false
    t.bigint "jugyo_id", null: false
    t.boolean "is_main_room", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jugyo_id"], name: "index_rooms_on_jugyo_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_rooms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_user_rooms_on_room_id"
    t.index ["user_id"], name: "index_user_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "name"
    t.datetime "last_used_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "jugyos", "universities"
  add_foreign_key "jugyos", "users", column: "admin_user_id"
  add_foreign_key "room_messages", "rooms"
  add_foreign_key "room_messages", "users"
  add_foreign_key "rooms", "jugyos"
  add_foreign_key "user_rooms", "rooms"
  add_foreign_key "user_rooms", "users"
end
