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

ActiveRecord::Schema.define(version: 20160724144733) do

  create_table "user_generals", force: :cascade do |t|
    t.string   "user_id",      limit: 36,  null: false
    t.string   "name",         limit: 50,  null: false
    t.integer  "age",          limit: 4,   null: false
    t.string   "sex",          limit: 10,  null: false
    t.string   "hobby",        limit: 150
    t.string   "mobile_phone", limit: 20,  null: false
    t.string   "address",      limit: 100
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "user_generals", ["user_id"], name: "index_user_generals_on_user_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nick_name",       limit: 50,  null: false
    t.string   "email",           limit: 30,  null: false
    t.string   "password_digest", limit: 200
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "remember_token",  limit: 200
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
