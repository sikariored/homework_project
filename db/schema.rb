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

ActiveRecord::Schema[7.1].define(version: 2023_12_27_110520) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_accounts_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_statuses", force: :cascade do |t|
    t.string "task_status_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_statuses", force: :cascade do |t|
    t.string "status_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "ticket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assigner_id"
    t.bigint "executor_id"
    t.bigint "task_status_id", default: 1
    t.index ["assigner_id"], name: "index_ticket_tasks_on_assigner_id"
    t.index ["executor_id"], name: "index_ticket_tasks_on_executor_id"
    t.index ["task_status_id"], name: "index_ticket_tasks_on_task_status_id"
    t.index ["ticket_id"], name: "index_ticket_tasks_on_ticket_id"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.string "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id", null: false
    t.bigint "ticket_status_id", default: 1, null: false
    t.bigint "responsible_id"
    t.bigint "ticket_type_id", default: 1, null: false
    t.index ["account_id"], name: "index_tickets_on_account_id"
    t.index ["responsible_id"], name: "index_tickets_on_responsible_id"
    t.index ["ticket_status_id"], name: "index_tickets_on_ticket_status_id"
    t.index ["ticket_type_id"], name: "index_tickets_on_ticket_type_id"
  end

  add_foreign_key "accounts", "roles"
  add_foreign_key "ticket_tasks", "accounts", column: "assigner_id"
  add_foreign_key "ticket_tasks", "accounts", column: "executor_id"
  add_foreign_key "ticket_tasks", "task_statuses"
  add_foreign_key "ticket_tasks", "tickets"
  add_foreign_key "tickets", "accounts"
  add_foreign_key "tickets", "accounts", column: "responsible_id"
  add_foreign_key "tickets", "ticket_statuses"
  add_foreign_key "tickets", "ticket_types"
end
