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

ActiveRecord::Schema[7.0].define(version: 2023_01_26_183347) do
  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.integer "post_id", null: false
    t.integer "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content", null: false
    t.integer "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_posts_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.text "username", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
    t.index ["username"], name: "index_profiles_on_username", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "profiles"
  add_foreign_key "posts", "profiles"
  add_foreign_key "profiles", "users"
end
