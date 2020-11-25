# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_24_231608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "setlists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "song_id"
    t.index ["song_id"], name: "index_setlists_on_song_id"
    t.index ["user_id"], name: "index_setlists_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.string "artist"
    t.text "lyrics"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_fav", default: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "setlist_id"
    t.bigint "song_id"
    t.index ["setlist_id"], name: "index_users_on_setlist_id"
    t.index ["song_id"], name: "index_users_on_song_id"
  end

  add_foreign_key "setlists", "songs"
  add_foreign_key "setlists", "users"
  add_foreign_key "songs", "users"
  add_foreign_key "users", "setlists"
  add_foreign_key "users", "songs"
end
