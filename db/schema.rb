# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_15_181443) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "roles", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label"], name: "index_roles_on_label", unique: true
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "idx_user_first_name"
  end


  create_view "mt_user_view", materialized: true, sql_definition: <<-SQL
      SELECT users.id,
      users.first_name,
      users.last_name,
      count(r.label) AS count
     FROM ((users
       JOIN roles_users ru ON ((users.id = ru.user_id)))
       JOIN roles r ON ((ru.role_id = r.id)))
    GROUP BY users.id, users.first_name, users.last_name;
  SQL
  create_view "user_roles", materialized: true, sql_definition: <<-SQL
      SELECT users.id,
      users.first_name,
      users.last_name,
      count(r.label) AS count
     FROM ((users
       JOIN roles_users ru ON ((users.id = ru.user_id)))
       JOIN roles r ON ((ru.role_id = r.id)))
    GROUP BY users.id, users.first_name, users.last_name;
  SQL
end
