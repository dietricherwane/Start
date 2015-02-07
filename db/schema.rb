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

ActiveRecord::Schema.define(version: 20150207153727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: true do |t|
    t.string   "label"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_project_categories", force: true do |t|
    t.string   "name",       limit: 100
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_project_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "completed_project_id"
    t.string   "caption",              limit: 100
  end

  create_table "completed_projects", force: true do |t|
    t.string   "name",                          limit: 100
    t.datetime "release_date"
    t.integer  "category_id"
    t.text     "description"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "completed_project_category_id"
  end

  create_table "contacts", force: true do |t|
    t.string   "name",       limit: 100
    t.string   "email",      limit: 100
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_id"
    t.string   "captcha",    limit: 20
  end

  create_table "projects", force: true do |t|
    t.string   "name",          limit: 100
    t.string   "email",         limit: 100
    t.string   "phone_number",  limit: 16
    t.string   "company_name",  limit: 100
    t.string   "website",       limit: 100
    t.string   "location",      limit: 100
    t.text     "details"
    t.datetime "begin_date"
    t.integer  "budget_id"
    t.text     "desired_task"
    t.text     "anything_else"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name",       limit: 100
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
