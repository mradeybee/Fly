ActiveRecord::Schema.define(version: 20151108174853) do

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "abrv"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "flight_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "flights", force: :cascade do |t|
    t.string   "airline"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.string   "price"
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "password"
    t.string   "image"
  end
end