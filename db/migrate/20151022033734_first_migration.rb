


ActiveRecord::Schema.define(version: 20151019163014) do

  create_table "tracks", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "artist"
    t.string   "title"
    t.string   "url"
    t.integer  "upvotes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "track_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
