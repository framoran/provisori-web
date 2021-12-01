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

ActiveRecord::Schema.define(version: 2021_11_30_080336) do

# Could not dump table "articles" because of following StandardError
#   Unknown type 'bool' for column 'published'

  create_table "elements", force: :cascade do |t|
    t.string "view", default: "default"
    t.string "subtitle_h1", default: "null"
    t.string "subtitle_h2", default: "null"
    t.string "elements_type", default: "article"
    t.string "src", default: "null"
    t.datetime "created_at"
    t.datetime "modified_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "response_game"
    t.datetime "created_at"
    t.datetime "modified_at"
  end

end
