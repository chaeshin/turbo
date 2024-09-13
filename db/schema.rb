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

ActiveRecord::Schema[7.1].define(version: 2024_09_13_143902) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rails_wl_bookmarks", force: :cascade do |t|
    t.bigint "rails_wl_movie_id", null: false
    t.bigint "rails_wl_list_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rails_wl_list_id"], name: "index_rails_wl_bookmarks_on_rails_wl_list_id"
    t.index ["rails_wl_movie_id"], name: "index_rails_wl_bookmarks_on_rails_wl_movie_id"
  end

  create_table "rails_wl_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rails_wl_movies", force: :cascade do |t|
    t.string "title"
    t.text "overview"
    t.string "poster_url"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turbo_bookings", force: :cascade do |t|
    t.bigint "turbo_user_id", null: false
    t.bigint "turbo_car_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.float "total_price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turbo_car_id"], name: "index_turbo_bookings_on_turbo_car_id"
    t.index ["turbo_user_id"], name: "index_turbo_bookings_on_turbo_user_id"
  end

  create_table "turbo_cars", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "year"
    t.float "rate"
    t.text "description"
    t.bigint "turbo_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turbo_user_id"], name: "index_turbo_cars_on_turbo_user_id"
  end

  create_table "turbo_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.index ["email"], name: "index_turbo_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_turbo_users_on_reset_password_token", unique: true
  end

  add_foreign_key "rails_wl_bookmarks", "rails_wl_lists"
  add_foreign_key "rails_wl_bookmarks", "rails_wl_movies"
  add_foreign_key "turbo_bookings", "turbo_cars"
  add_foreign_key "turbo_bookings", "turbo_users"
  add_foreign_key "turbo_cars", "turbo_users"
end
