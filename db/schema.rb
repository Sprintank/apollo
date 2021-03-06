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

ActiveRecord::Schema.define(version: 20150124210929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "band_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "band_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "band_users", ["band_id"], name: "index_band_users_on_band_id", using: :btree
  add_index "band_users", ["user_id"], name: "index_band_users_on_user_id", using: :btree

  create_table "bands", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "identifier",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "soundcloud_id"
    t.string   "hottest_track_permalink"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "theme_id",                null: false
  end

  add_index "bands", ["identifier"], name: "index_bands_on_identifier", unique: true, using: :btree

  create_table "field_option_defaults", force: true do |t|
    t.integer  "theme_id"
    t.integer  "field_option_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "field_option_defaults", ["field_option_id"], name: "index_field_option_defaults_on_field_option_id", using: :btree
  add_index "field_option_defaults", ["theme_id"], name: "index_field_option_defaults_on_theme_id", using: :btree

  create_table "field_options", force: true do |t|
    t.string   "name"
    t.string   "identifier", null: false
    t.string   "kind"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "field_options", ["identifier"], name: "index_field_options_on_identifier", unique: true, using: :btree

  create_table "field_values", force: true do |t|
    t.integer  "band_id"
    t.integer  "field_option_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "field_values", ["band_id"], name: "index_field_values_on_band_id", using: :btree
  add_index "field_values", ["field_option_id"], name: "index_field_values_on_field_option_id", using: :btree

  create_table "themes", force: true do |t|
    t.string   "identifier",                  null: false
    t.boolean  "is_featured", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "themes", ["identifier"], name: "index_themes_on_identifier", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "soundcloud_id"
    t.string   "username"
    t.string   "name"
    t.string   "access_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
