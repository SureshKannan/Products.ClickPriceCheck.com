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

ActiveRecord::Schema.define(version: 20140611110749) do

  create_table "categories", force: true do |t|
    t.string   "name",            null: false
    t.integer  "categorytype_id"
    t.integer  "category_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categoryTypes", force: true do |t|
    t.string   "name",       null: false
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_stores", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_stores_profiles", id: false, force: true do |t|
    t.integer "favorite_store_id"
    t.integer "profile_id"
  end

  create_table "interests", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests_profiles", id: false, force: true do |t|
    t.integer "interest_id"
    t.integer "profile_id"
  end

  create_table "priorities", force: true do |t|
    t.string   "name",       null: false
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "aptNo"
    t.string   "street"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "postalcode"
    t.string   "phoneNumber"
    t.string   "cellphone"
    t.string   "gender"
    t.string   "birthday"
    t.string   "ethncity"
    t.string   "maritalStatus"
    t.string   "carrier"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles_send_mails", id: false, force: true do |t|
    t.integer "send_email_id"
    t.integer "profile_id"
  end

  create_table "send_emails", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
