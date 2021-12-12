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

ActiveRecord::Schema.define(version: 2021_12_03_073420) do

# Could not dump table "articles" because of following StandardError
#   Unknown type '' for column 'published'

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.integer "user_id"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "elements", force: :cascade do |t|
    t.integer "article_id"
    t.string "elements_type", default: "null"
    t.string "subtitle1", default: "null"
    t.string "subtitle2", default: "null"
    t.string "body", default: "null"
    t.string "src", default: "null"
    t.string "alt", default: "null"
    t.datetime "created_at"
    t.datetime "modified_at"
    t.index ["article_id"], name: "index_elements_on_article_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "question"
    t.integer "type_of_question"
    t.string "src"
    t.string "response"
    t.datetime "created_at"
    t.datetime "modified_at"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "article_id"
    t.integer "user_id"
    t.boolean "like"
    t.datetime "created_at"
    t.datetime "modified_at"
    t.index ["article_id"], name: "index_likes_on_article_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "response_game"
    t.datetime "created_at"
    t.datetime "modified_at"
    t.string "role"
    t.string "avatar"
  end

  create_table "winners", force: :cascade do |t|
    t.integer "article_id"
    t.integer "user_id"
    t.integer "week"
    t.integer "year"
    t.datetime "created_at"
    t.datetime "modified_at"
    t.index ["article_id"], name: "index_winners_on_article_id"
    t.index ["user_id"], name: "index_winners_on_user_id"
  end

  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "elements", "articles"
  add_foreign_key "likes", "articles"
  add_foreign_key "likes", "users"
  add_foreign_key "winners", "articles"
  add_foreign_key "winners", "users"
end
