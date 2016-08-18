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

ActiveRecord::Schema.define(:version => 20121016202236) do

  create_table "photos", :force => true do |t|
    t.integer  "site_id"
    t.date     "taken_on"
    t.string   "owner"
    t.string   "provider"
    t.integer  "uploader"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "image"
    t.boolean  "verified",   :default => false
  end

  add_index "photos", ["site_id", "taken_on"], :name => "index_photos_on_site_id_and_taken_on"
  add_index "photos", ["site_id"], :name => "index_photos_on_site_id"
  add_index "photos", ["uploader", "created_at"], :name => "index_photos_on_uploader_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "relationships", ["child_id"], :name => "index_relationships_on_child_id", :unique => true
  add_index "relationships", ["parent_id", "child_id"], :name => "index_relationships_on_parent_id_and_child_id", :unique => true
  add_index "relationships", ["parent_id"], :name => "index_relationships_on_parent_id"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "tag"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "submitted_by"
    t.integer  "edited_by"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "sites", ["edited_by"], :name => "index_sites_on_edited_by"
  add_index "sites", ["name"], :name => "index_sites_on_name", :unique => true
  add_index "sites", ["submitted_by"], :name => "index_sites_on_submitted_by"
  add_index "sites", ["tag"], :name => "index_sites_on_tag"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.string   "image"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
