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

ActiveRecord::Schema.define(version: 2020_12_06_131232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "screening_id"
    t.string "name"
    t.string "email"
    t.string "mobile_number"
    t.integer "booked_seats", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "payment_status", default: false
    t.integer "amount", default: 0
    t.integer "show_slot_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "screenings", force: :cascade do |t|
    t.integer "show_id"
    t.integer "rows"
    t.integer "total_seats"
    t.jsonb "reserved_seats", default: []
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "show_slots", force: :cascade do |t|
    t.string "timings"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shows", force: :cascade do |t|
    t.integer "movie_id"
    t.datetime "show_date"
    t.text "show_slot", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
