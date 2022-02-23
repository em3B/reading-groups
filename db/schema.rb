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

ActiveRecord::Schema.define(version: 2022_02_23_184931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "daily_readings", force: :cascade do |t|
    t.bigint "text_id", null: false
    t.bigint "reading_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "excerpt"
    t.index ["reading_group_id"], name: "index_daily_readings_on_reading_group_id"
    t.index ["text_id"], name: "index_daily_readings_on_text_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "reading_group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reading_group_id"], name: "index_members_on_reading_group_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "daily_reading_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["daily_reading_id"], name: "index_questions_on_daily_reading_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "reading_groups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_reading_groups_on_user_id"
  end

  create_table "texts", force: :cascade do |t|
    t.string "author"
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cover_image"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.integer "teacher_id"
    t.string "school_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "daily_readings", "reading_groups"
  add_foreign_key "daily_readings", "texts"
  add_foreign_key "members", "reading_groups"
  add_foreign_key "members", "users"
  add_foreign_key "questions", "daily_readings"
  add_foreign_key "questions", "users"
  add_foreign_key "reading_groups", "users"
end
