# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141023225344) do

  create_table "assets", force: true do |t|
    t.string   "title"
    t.string   "file"
    t.integer  "asset_type", limit: 1, default: 0
    t.string   "s3_id"
    t.string   "s3_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     limit: 1, default: 0
    t.integer  "task_id"
  end

  add_index "assets", ["task_id"], name: "index_assets_on_task_id"

  create_table "clients", force: true do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["is_active"], name: "index_clients_on_is_active"

  create_table "guidespark_users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "is_active",      default: true
    t.integer  "profile"
    t.string   "office_address"
    t.string   "office_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guidespark_users", ["is_active"], name: "index_guidespark_users_on_is_active"
  add_index "guidespark_users", ["profile"], name: "index_guidespark_users_on_profile"

  create_table "tasks", force: true do |t|
    t.string   "video_title"
    t.integer  "type_script"
    t.integer  "number_chapters"
    t.string   "notes"
    t.boolean  "rush"
    t.decimal  "rate"
    t.datetime "due_date"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "voice_talent_user_id"
    t.integer  "client_id"
    t.boolean  "deleted",              default: false
    t.integer  "writer_id"
    t.integer  "content_ops_id"
  end

  add_index "tasks", ["client_id"], name: "index_tasks_on_client_id"
  add_index "tasks", ["due_date"], name: "index_tasks_on_due_date"
  add_index "tasks", ["status"], name: "index_tasks_on_status"
  add_index "tasks", ["voice_talent_user_id"], name: "index_tasks_on_voice_talent_user_id"

  create_table "voice_talent_users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "is_active",         default: true
    t.boolean  "is_veteran",        default: false
    t.string   "office_phone"
    t.decimal  "full_rate",         default: 0.0
    t.decimal  "rush_full_rate",    default: 0.0
    t.decimal  "partial_rate",      default: 0.0
    t.decimal  "rush_partial_rate", default: 0.0
    t.decimal  "correction_rate",   default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "voice_talent_users", ["is_active"], name: "index_voice_talent_users_on_is_active"

end
