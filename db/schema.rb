# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160803215501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "ordinal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: :cascade do |t|
    t.date     "match_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "season_id"
  end

  create_table "old_users", force: :cascade do |t|
    t.string   "username",          limit: 255
    t.string   "crypted_password",  limit: 255
    t.string   "password_salt",     limit: 255
    t.string   "persistence_token", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["game_id", "player_id"], name: "ak_game_players", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.string   "ordinal",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "start_year"
    t.integer  "stop_year"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                               null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
