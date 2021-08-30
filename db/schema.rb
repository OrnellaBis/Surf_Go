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

ActiveRecord::Schema.define(version: 2021_08_30_094859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_spots", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_favorite_spots_on_spot_id"
    t.index ["user_id"], name: "index_favorite_spots_on_user_id"
  end

  create_table "forecasts", force: :cascade do |t|
    t.float "air_temperature"
    t.datetime "time"
    t.float "cloud_cover"
    t.float "current_direction"
    t.float "current_speed"
    t.float "swell_direction"
    t.float "swell_height"
    t.float "water_temperature"
    t.float "wave_direction"
    t.float "wave_height"
    t.float "wave_period"
    t.float "wind_wave_height"
    t.float "wind_direction"
    t.float "wind_speed"
    t.float "gust"
    t.float "precipitation"
    t.float "uv_index"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "spot_id", null: false
    t.index ["spot_id"], name: "index_forecasts_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "city_name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "first_name"
    t.boolean "air_temperature", default: true
    t.boolean "cloud_cover", default: true
    t.boolean "current_direction", default: false
    t.boolean "current_speed", default: false
    t.boolean "swell_direction", default: false
    t.boolean "swell_height", default: false
    t.boolean "water_temperature", default: false
    t.boolean "wave_direction", default: false
    t.boolean "wave_height", default: true
    t.boolean "wave_period", default: false
    t.boolean "wind_wave_height", default: false
    t.boolean "wind_direction", default: false
    t.boolean "wind_speed", default: false
    t.boolean "gust", default: false
    t.boolean "precipitation", default: false
    t.boolean "uv_index", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorite_spots", "spots"
  add_foreign_key "favorite_spots", "users"
  add_foreign_key "forecasts", "spots"
end
