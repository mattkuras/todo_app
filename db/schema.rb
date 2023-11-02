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

ActiveRecord::Schema[7.1].define(version: 2023_11_02_024211) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "intention_type", ["task", "habit", "nice_to_have"]
  create_enum "months", ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  create_enum "quarter", ["1", "2", "3", "4"]

  create_table "access_tokens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_access_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_access_tokens_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "user_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "key_results", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "completed", default: false
    t.integer "progress", default: 0
    t.bigint "objective_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["objective_id"], name: "index_key_results_on_objective_id"
    t.index ["user_id"], name: "index_key_results_on_user_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "resolution_id"
    t.bigint "goal_id"
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "quarter", null: false, enum_type: "quarter"
    t.boolean "completed", default: false, null: false
    t.index ["goal_id"], name: "index_objectives_on_goal_id"
    t.index ["resolution_id"], name: "index_objectives_on_resolution_id"
    t.index ["user_id"], name: "index_objectives_on_user_id"
  end

  create_table "resolutions", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.bigint "goal_id"
    t.integer "year", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_resolutions_on_goal_id"
    t.index ["user_id"], name: "index_resolutions_on_user_id"
  end

  create_table "shapes", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.bigint "user_id", null: false
    t.bigint "objective_id"
    t.bigint "resolution_id"
    t.enum "month", null: false, enum_type: "months"
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["objective_id"], name: "index_shapes_on_objective_id"
    t.index ["resolution_id"], name: "index_shapes_on_resolution_id"
    t.index ["user_id"], name: "index_shapes_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.boolean "completed", default: false, null: false
    t.boolean "backlog", default: false, null: false
    t.bigint "weekly_intention_id"
    t.bigint "shape_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shape_id"], name: "index_todos_on_shape_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
    t.index ["weekly_intention_id"], name: "index_todos_on_weekly_intention_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "otp_secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "weekly_intentions", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.bigint "shape_id"
    t.enum "intention_type", default: "task", enum_type: "intention_type"
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shape_id"], name: "index_weekly_intentions_on_shape_id"
    t.index ["user_id"], name: "index_weekly_intentions_on_user_id"
  end

  add_foreign_key "access_tokens", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "key_results", "objectives"
  add_foreign_key "key_results", "users"
  add_foreign_key "objectives", "goals"
  add_foreign_key "objectives", "resolutions"
  add_foreign_key "objectives", "users"
  add_foreign_key "resolutions", "goals"
  add_foreign_key "resolutions", "users"
  add_foreign_key "shapes", "objectives"
  add_foreign_key "shapes", "resolutions"
  add_foreign_key "shapes", "users"
  add_foreign_key "todos", "shapes"
  add_foreign_key "todos", "users"
  add_foreign_key "todos", "weekly_intentions"
  add_foreign_key "weekly_intentions", "shapes"
  add_foreign_key "weekly_intentions", "users"
end
