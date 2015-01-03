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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150103071738) do

  create_table "entries", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.datetime "original_created_at"
    t.text     "content"
    t.string   "guid"
    t.integer  "update_sequence_num"
    t.datetime "original_updated_at"
  end

  create_table "resources", :force => true do |t|
    t.string   "filename"
    t.binary   "body",                :limit => 16777215
    t.string   "extension"
    t.string   "mime"
    t.string   "body_hash"
    t.integer  "entry_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "guid"
    t.integer  "update_sequence_num"
    t.integer  "width"
    t.integer  "height"
  end

  create_table "tags", :force => true do |t|
    t.string   "guid"
    t.string   "name"
    t.integer  "update_sequence_num"
    t.integer  "entry_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "tags", ["entry_id"], :name => "index_tags_on_entry_id"

end
