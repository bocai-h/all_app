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

ActiveRecord::Schema.define(version: 20160414155257) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",       limit: 50,  null: false
    t.string   "content",     limit: 500, null: false
    t.string   "author",      limit: 32,  null: false
    t.string   "status_code", limit: 30
    t.string   "created_by",  limit: 36
    t.string   "updated_by",  limit: 36
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",     limit: 100, null: false
    t.string   "email_address", limit: 50,  null: false
    t.string   "first_name",    limit: 50,  null: false
    t.string   "last_name",     limit: 50
    t.string   "status_code",   limit: 30
    t.string   "created_by",    limit: 36
    t.string   "updated_by",    limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email_address"], name: "index_users_on_email_address", unique: true, using: :btree

end
