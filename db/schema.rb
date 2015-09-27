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

ActiveRecord::Schema.define(version: 20150927140920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "image_credit"
    t.string   "website"
    t.string   "bandcamp"
    t.string   "facebook"
    t.string   "soundcloud"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "contents", force: true do |t|
    t.text     "gigs_header"
    t.text     "venues_header"
    t.text     "bands_header"
    t.text     "about_header"
    t.text     "about_content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "features_header"
  end

  create_table "feature_images", force: true do |t|
    t.string   "image"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "feature_id"
    t.boolean  "cover",      default: false
  end

  add_index "feature_images", ["feature_id"], name: "index_feature_images_on_feature_id", using: :btree

  create_table "features", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.integer  "author_id"
    t.text     "body"
    t.boolean  "display_subtitle"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "published",        default: false, null: false
    t.string   "slug",                             null: false
  end

  add_index "features", ["author_id"], name: "index_features_on_author_id", using: :btree
  add_index "features", ["slug"], name: "index_features_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "gigs", force: true do |t|
    t.date     "showdate"
    t.float    "price"
    t.text     "url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "band"
    t.string   "venue_name"
    t.string   "venue_address"
  end

  create_table "keywords", force: true do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords_posts", force: true do |t|
    t.integer  "keyword_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "keywords_posts", ["keyword_id"], name: "index_keywords_posts_on_keyword_id", using: :btree
  add_index "keywords_posts", ["post_id"], name: "index_keywords_posts_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "primary_image"
    t.integer  "layout",        default: 1
    t.datetime "publish_date"
    t.boolean  "published",     default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "secondaryimages", force: true do |t|
    t.string   "url"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "secondaryimages", ["post_id"], name: "index_secondaryimages_on_post_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "band_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["band_id"], name: "index_taggings_on_band_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "role",                   default: "guest", null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "url"
    t.string   "phone"
  end

end
