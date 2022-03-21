
ActiveRecord::Schema.define(version: 2022_03_01_195507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "date_of_birth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "is_active"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
