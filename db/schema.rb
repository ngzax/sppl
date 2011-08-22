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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110822014919) do

  create_table "games", :force => true do |t|
    t.integer  "match_id"
    t.integer  "ordinal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", :force => true do |t|
    t.date     "match_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "season_id"
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", :force => true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["game_id", "player_id"], :name => "ak_game_players"

  create_table "seasons", :force => true do |t|
    t.string   "ordinal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "start_year"
    t.integer  "stop_year"
  end

end
