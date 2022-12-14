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

ActiveRecord::Schema[7.0].define(version: 2022_12_13_172003) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.date "date"
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_diaries_on_event_id"
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "events_resources", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "resource_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "timing"
    t.index ["event_id"], name: "index_events_resources_on_event_id"
    t.index ["resource_id"], name: "index_events_resources_on_resource_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "name"
  end

  create_table "resources", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "category"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "name"
    t.index ["profile_id"], name: "index_resources_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "access_blog", default: false, null: false
    t.bigint "profile_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_id"], name: "index_users_on_profile_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blogs", "users"
  add_foreign_key "diaries", "events"
  add_foreign_key "diaries", "users"
  add_foreign_key "events", "users"
  add_foreign_key "events_resources", "events"
  add_foreign_key "events_resources", "resources"
  add_foreign_key "resources", "profiles"
  add_foreign_key "users", "profiles"
end
