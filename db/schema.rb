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
ActiveRecord::Schema.define(version: 20180408035906) do
=======
ActiveRecord::Schema.define(version: 20180407214316) do
>>>>>>> photo_upload

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "remember_digest"
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.string "album_title"
    t.string "cover_photo"
    t.integer "photo_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.text "description"
    t.string "display_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.bigint "event_id"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_packages_on_event_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "caption"
    t.string "photo_location"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_photos_on_album_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "amount_paid"
    t.bigint "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_tickets_on_package_id"
  end

  add_foreign_key "packages", "events"
  add_foreign_key "photos", "albums"
  add_foreign_key "tickets", "packages"
end
