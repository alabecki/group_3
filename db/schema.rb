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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160323070712) do
=======
ActiveRecord::Schema.define(version: 20160312042633) do
>>>>>>> 3316dbe249a07481d162d96d18a76a6cd0b7ade6

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

=======
>>>>>>> 3316dbe249a07481d162d96d18a76a6cd0b7ade6
  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "street_address"
    t.string   "city"
    t.string   "country"
    t.string   "postal_code"
    t.boolean  "lol"
    t.boolean  "dota2"
    t.boolean  "smite"
    t.boolean  "hots"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "longitude"
    t.float    "latitude"
    t.string   "password_digest"
    t.text     "description"
    t.boolean  "admin",               default: false
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",           default: false
    t.datetime "activated_at"
    t.string   "state"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
<<<<<<< HEAD
=======
    t.string   "twitter_name"
>>>>>>> 3316dbe249a07481d162d96d18a76a6cd0b7ade6
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
<<<<<<< HEAD
    t.string   "twitter_name"
  end

  add_foreign_key "microposts", "users"
=======
  end

>>>>>>> 3316dbe249a07481d162d96d18a76a6cd0b7ade6
end
