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

ActiveRecord::Schema[7.0].define(version: 2022_10_14_065628) do
  create_table "client_requests", force: :cascade do |t|
    t.string "customer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kanban_column_id", null: false
    t.integer "position"
    t.index ["kanban_column_id"], name: "index_client_requests_on_kanban_column_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "client_request_id", null: false
    t.integer "no_of_resources"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_request_id"], name: "index_departments_on_client_request_id"
  end

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.date "interview_date"
    t.integer "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "developer_status"
    t.integer "dev_position"
    t.index ["department_id"], name: "index_developers_on_department_id"
  end

  create_table "kanban_columns", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "developers", "departments"
end
