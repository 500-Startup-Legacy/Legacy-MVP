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

ActiveRecord::Schema.define(version: 20150422195254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "memories", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "memorialized_user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "memories", ["user_id"], name: "index_memories_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "memorializer_id"
    t.integer  "memorialized_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "group"
  end

  add_index "relationships", ["memorialized_id"], name: "index_relationships_on_memorialized_id", using: :btree
  add_index "relationships", ["memorializer_id", "memorialized_id"], name: "index_relationships_on_memorializer_id_and_memorialized_id", unique: true, using: :btree
  add_index "relationships", ["memorializer_id"], name: "index_relationships_on_memorializer_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_token"
    t.boolean  "public",          default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
