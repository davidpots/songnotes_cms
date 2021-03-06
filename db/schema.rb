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

ActiveRecord::Schema.define(:version => 20130509122837) do

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.string   "label"
    t.integer  "year"
    t.string   "image_url"
    t.string   "url_wikipedia"
    t.string   "url_rdio"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.text     "bio_short"
    t.text     "bio_long"
    t.string   "image_url"
    t.string   "url_website"
    t.string   "url_twitter"
    t.string   "url_facebook"
    t.string   "url_wikipedia"
    t.string   "url_youtube_official"
    t.string   "url_rdio"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "songs", :force => true do |t|
    t.string   "title"
    t.integer  "year"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.text     "lyrics_text"
    t.text     "lyrics_html_mono"
    t.boolean  "published",            :default => false
    t.text     "notes"
    t.string   "record_label"
    t.text     "chords"
    t.boolean  "repeated_chords",      :default => false
    t.string   "slug"
    t.integer  "artist_id"
    t.integer  "album_id"
    t.text     "lyrics_raw"
    t.text     "lyrics_signature"
    t.string   "key"
    t.string   "url_wikipedia"
    t.string   "url_youtube_official"
    t.string   "url_rdio"
    t.text     "listenplay"
  end

  add_index "songs", ["slug"], :name => "index_songs_on_urlslug"

end
