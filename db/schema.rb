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

ActiveRecord::Schema.define(version: 20180921053521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id", using: :btree
  end

  create_table "responses", force: :cascade do |t|
    t.text     "answer"
    t.integer  "user_id"
    t.integer  "survey_response_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "question_id"
    t.index ["survey_response_id"], name: "index_responses_on_survey_response_id", using: :btree
    t.index ["user_id"], name: "index_responses_on_user_id", using: :btree
  end

  create_table "survey_responses", force: :cascade do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_survey_responses_on_survey_id", using: :btree
    t.index ["user_id"], name: "index_survey_responses_on_user_id", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "is_admin"
  end

end
