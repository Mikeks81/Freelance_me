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

ActiveRecord::Schema.define(version: 20160228025748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "street"
    t.string   "business_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "email"
    t.string   "phone"
    t.string   "state"
    t.integer  "zip"
    t.string   "city"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.text     "description"
    t.decimal  "amount"
    t.date     "date"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "expenses", ["job_id"], name: "index_expenses_on_job_id", using: :btree

  create_table "jobitems", force: :cascade do |t|
    t.text     "name"
    t.date     "date"
    t.decimal  "price"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "jobitems", ["job_id"], name: "index_jobitems_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.integer  "client_id"
    t.text     "job_description"
    t.date     "date_of_job"
    t.boolean  "job_complete"
    t.boolean  "balance_zero"
    t.text     "notes"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "name"
    t.time     "time"
    t.decimal  "price",           precision: 8, scale: 2
    t.decimal  "balance",         precision: 8, scale: 2
    t.date     "date_of_end"
  end

  add_index "jobs", ["client_id"], name: "index_jobs_on_client_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount"
    t.date     "date"
    t.string   "form"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payments", ["job_id"], name: "index_payments_on_job_id", using: :btree

  create_table "todos", force: :cascade do |t|
    t.string   "item"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
    t.boolean  "completed"
  end

  add_index "todos", ["user_id"], name: "index_todos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "business_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "clients", "users"
  add_foreign_key "expenses", "jobs"
  add_foreign_key "jobitems", "jobs"
  add_foreign_key "jobs", "clients"
  add_foreign_key "payments", "jobs"
  add_foreign_key "todos", "users"
end
