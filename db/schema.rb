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

ActiveRecord::Schema.define(version: 20160508121300) do

  create_table "artists", force: :cascade do |t|
    t.string   "artist_name",  limit: 255
    t.string   "artist_same",  limit: 255
    t.float    "artist_score", limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "i_charts", force: :cascade do |t|
    t.integer  "iChart_rank",   limit: 4
    t.string   "iChart_artist", limit: 255
    t.string   "iChart_song",   limit: 255
    t.string   "iChart_album",  limit: 255
    t.string   "iChart_etm",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "search_daums", force: :cascade do |t|
    t.string   "issue_title",       limit: 255
    t.integer  "issue_rank",        limit: 4
    t.integer  "issue_today_total", limit: 4
    t.datetime "issue_date"
    t.integer  "issue_time",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "search_googles", force: :cascade do |t|
    t.string   "issue_title",       limit: 255
    t.integer  "issue_rank",        limit: 4
    t.integer  "issue_today_total", limit: 4
    t.datetime "issue_date"
    t.integer  "issue_time",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "search_navers", force: :cascade do |t|
    t.string   "issue_title",       limit: 255
    t.integer  "issue_rank",        limit: 4
    t.integer  "issue_today_total", limit: 4
    t.datetime "issue_date"
    t.integer  "issue_time",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
