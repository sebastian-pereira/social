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

ActiveRecord::Schema.define(:version => 20130330204547) do

  create_table "__users", :force => true do |t|
    t.string   "name",           :limit => 20,                    :null => false
    t.string   "surname",        :limit => 20,                    :null => false
    t.string   "email",                                           :null => false
    t.string   "password",       :limit => 32,                    :null => false
    t.integer  "global_role_id",                                  :null => false
    t.string   "user_hash",      :limit => 32
    t.boolean  "active",                       :default => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "_sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "_sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "_sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "albums", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "alias",                      :null => false
    t.string   "announce",    :limit => 512
    t.text     "description"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name",       :limit => 25, :null => false
    t.string   "alias",      :limit => 25, :null => false
    t.integer  "country_id",               :null => false
    t.string   "city_image"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "countries", :force => true do |t|
    t.string "name", :limit => 25, :null => false
  end

  create_table "faculties", :force => true do |t|
    t.string   "name"
    t.integer  "university_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "global_roles", :force => true do |t|
    t.string  "name",   :limit => 20
    t.string  "alias",  :limit => 20
    t.boolean "active",               :default => true
  end

  create_table "material_types", :force => true do |t|
    t.string "name", :limit => 20, :null => false
  end

  create_table "materials", :force => true do |t|
    t.string   "material_type"
    t.boolean  "active"
    t.boolean  "trash"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "messenger"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "reciever_id"
    t.boolean  "is_read",     :default => false
  end

  create_table "photos", :force => true do |t|
    t.string   "path"
    t.string   "description", :limit => 1024
    t.integer  "album_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.string   "shash"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "setting_images", :force => true do |t|
    t.integer  "setting_id", :null => false
    t.string   "path",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "setting_types", :force => true do |t|
    t.string "name",  :limit => 20, :null => false
    t.string "alias", :limit => 20, :null => false
  end

  create_table "settings", :force => true do |t|
    t.integer "setting_type_id",               :null => false
    t.string  "value",                         :null => false
    t.integer "sort"
    t.string  "alias",           :limit => 20
  end

  create_table "universities", :force => true do |t|
    t.string   "name",                     :null => false
    t.string   "abbr",       :limit => 20, :null => false
    t.integer  "city_id",                  :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "user_attrs", :force => true do |t|
    t.string   "user_id"
    t.string   "mobile_phone"
    t.string   "skype"
    t.string   "web_site"
    t.integer  "city_id"
    t.string   "native_city",        :limit => 30
    t.integer  "marital_status_id"
    t.integer  "politic_id"
    t.integer  "religion_id"
    t.integer  "sex"
    t.datetime "birth_date"
    t.text     "activities"
    t.text     "favourite_films"
    t.text     "favourite_books"
    t.text     "favourite_tv_shows"
    t.text     "favourite_games"
    t.text     "favourite_phrases"
    t.text     "about_myself"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "user_friends", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.boolean  "is_read",                  :default => false
    t.integer  "sender",                                      :null => false
    t.boolean  "confirmed",                :default => false, :null => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "hash",       :limit => 32,                    :null => false
  end

  create_table "user_roles", :force => true do |t|
    t.string   "name",       :limit => 50
    t.string   "alias",      :limit => 20
    t.boolean  "active",                   :default => true
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "user_roles", ["alias"], :name => "index_user_roles_on_alias", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",         :limit => 50,                    :null => false
    t.string   "surname",      :limit => 50,                    :null => false
    t.string   "email",                                         :null => false
    t.string   "password",     :limit => 32,                    :null => false
    t.string   "user_hash",    :limit => 32,                    :null => false
    t.string   "avatar"
    t.integer  "user_role_id"
    t.boolean  "active",                     :default => true
    t.boolean  "trash",                      :default => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["user_role_id"], :name => "fk_role"

  create_table "users_messages", :force => true do |t|
    t.integer "message_id"
    t.integer "user_id"
    t.boolean "is_read",    :default => false, :null => false
  end

  create_table "users_orig", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password"
    t.integer  "marital_status_id"
    t.integer  "city_id"
    t.string   "mobile_phone"
    t.string   "skype"
    t.string   "web_site"
    t.integer  "politic_id"
    t.integer  "religion_id"
    t.text     "activities"
    t.text     "favourite_films"
    t.text     "favourite_books"
    t.text     "favourite_tv_shows"
    t.text     "favourite_games"
    t.text     "favourite_phrases"
    t.text     "about_myself"
    t.integer  "material_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.integer  "sex"
    t.date     "birth_date"
    t.boolean  "active",                           :default => true,  :null => false
    t.boolean  "trash",                            :default => false, :null => false
    t.string   "native_city"
    t.string   "user_hash",          :limit => 32,                    :null => false
    t.string   "avatar"
    t.integer  "global_role_id"
  end

  add_index "users_orig", ["email"], :name => "email_index"
  add_index "users_orig", ["global_role_id"], :name => "role_key"
  add_index "users_orig", ["name"], :name => "name_index"
  add_index "users_orig", ["surname"], :name => "surname_index"

  create_table "users_universities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "university_id"
    t.integer  "faculty_id"
    t.integer  "studentstatus_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
