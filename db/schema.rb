ActiveRecord::Schema.define(version: 2022_01_18_025007) do

  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.text "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
