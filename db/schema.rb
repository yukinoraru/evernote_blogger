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

ActiveRecord::Schema.define(version: 20150103071738) do

  create_table "entries", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "original_created_at"
    t.text     "content",             limit: 65535
    t.string   "guid",                limit: 255
    t.integer  "update_sequence_num", limit: 4
    t.datetime "original_updated_at"
  end

  create_table "resources", force: :cascade do |t|
    t.string   "filename",            limit: 255
    t.binary   "body",                limit: 16777215
    t.string   "extension",           limit: 255
    t.string   "mime",                limit: 255
    t.string   "body_hash",           limit: 255
    t.integer  "entry_id",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                limit: 255
    t.integer  "update_sequence_num", limit: 4
    t.integer  "width",               limit: 4
    t.integer  "height",              limit: 4
  end

  create_table "tags", force: :cascade do |t|
    t.string   "guid",                limit: 255
    t.string   "name",                limit: 255
    t.integer  "update_sequence_num", limit: 4
    t.integer  "entry_id",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["entry_id"], name: "index_tags_on_entry_id", using: :btree

end
