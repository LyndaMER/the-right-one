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

ActiveRecord::Schema[7.1].define(version: 2024_03_05_145258) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audition_tags", force: :cascade do |t|
    t.bigint "audition_id", null: false
    t.bigint "tag_id", null: false
    t.boolean "required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audition_id"], name: "index_audition_tags_on_audition_id"
    t.index ["tag_id"], name: "index_audition_tags_on_tag_id"
  end

  create_table "auditions", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.date "date"
    t.index ["user_id"], name: "index_auditions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.text "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_tags", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_user_tags_on_tag_id"
    t.index ["user_id"], name: "index_user_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.string "phone_number"
    t.string "social_link"
    t.string "address"
    t.string "city"
    t.string "languages"
    t.string "portfolio"
    t.string "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.string "pola_face"
    t.string "pola_3_4"
    t.string "pola_silhouette"
    t.string "pola_mains"
    t.string "presentation_video"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audition_tags", "auditions"
  add_foreign_key "audition_tags", "tags"
  add_foreign_key "auditions", "users"
  add_foreign_key "user_tags", "tags"
  add_foreign_key "user_tags", "users"
end
