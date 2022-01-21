ActiveRecord::Schema.define(version: 2022_01_21_025743) do

  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "picture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["picture_id"], name: "index_favorites_on_picture_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.text "image", null: false
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.text "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "favorites", "pictures"
  add_foreign_key "favorites", "users"
  add_foreign_key "pictures", "users"
end
