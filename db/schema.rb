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

ActiveRecord::Schema.define(version: 2019_07_09_042047) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "game_genres", force: :cascade do |t|
    t.integer "game_id"
    t.integer "genre_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.integer "publisher_id"
    t.integer "max_players"
    t.string "play_time"
    t.string "year_published"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
  end

  create_table "user_games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "title"
    t.string "bio"
  end

end
