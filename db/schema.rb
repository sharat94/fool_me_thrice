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

ActiveRecord::Schema.define(version: 2019_04_13_192748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.bigint "topic_id"
    t.integer "upvotes", default: 0
    t.integer "downvotes", default: 0
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "fake", default: false
    t.index ["topic_id"], name: "index_cards_on_topic_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.bigint "topic_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_subjects_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_topics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "topic_id"], name: "index_user_topics_on_user_id_and_topic_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "correct_answers", default: 0
    t.integer "wrong_answers", default: 0
    t.string "badges", default: [], array: true
    t.integer "cards_read", default: [], array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verbs", force: :cascade do |t|
    t.bigint "topic_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_verbs_on_topic_id"
  end

  create_table "victims", force: :cascade do |t|
    t.bigint "topic_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_victims_on_topic_id"
  end

  add_foreign_key "cards", "topics"
  add_foreign_key "cards", "users"
  add_foreign_key "subjects", "topics"
  add_foreign_key "verbs", "topics"
  add_foreign_key "victims", "topics"
end
