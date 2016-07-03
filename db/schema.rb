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

ActiveRecord::Schema.define(version: 20160703150925) do

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

  create_table "settlement_details", force: :cascade do |t|
    t.string   "settlement_id",         limit: 36,  null: false
    t.string   "service_code",          limit: 100
    t.string   "car_number",            limit: 50
    t.string   "insurance_name",        limit: 50
    t.string   "insurance_person",      limit: 50
    t.string   "insuranced_person",     limit: 50
    t.string   "money_type",            limit: 10
    t.string   "circle_time",           limit: 5
    t.string   "insurance_money",       limit: 20
    t.string   "actual_money",          limit: 20
    t.string   "handling_charge",       limit: 20
    t.string   "handling_charge_ratio", limit: 5
    t.string   "start_date",            limit: 20
    t.string   "service_department",    limit: 200
    t.string   "comment",               limit: 500
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "settlements", force: :cascade do |t|
    t.string   "agent_name",         limit: 30
    t.string   "agent_code",         limit: 100
    t.string   "list_code",          limit: 100
    t.string   "agent_certif_code",  limit: 100
    t.string   "pay_bank",           limit: 80
    t.string   "pay_account",        limit: 100
    t.string   "account_name",       limit: 50
    t.string   "money_type",         limit: 20
    t.string   "print_date",         limit: 30
    t.string   "contract",           limit: 3
    t.string   "cost_tax",           limit: 20
    t.string   "after_cost_tax_fee", limit: 20
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

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
