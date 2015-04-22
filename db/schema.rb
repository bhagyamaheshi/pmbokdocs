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

ActiveRecord::Schema.define(version: 20150416081834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "activityName"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "project_id"
    t.integer  "activity_category_id"
    t.integer  "assignerID"
    t.date     "dueDate"
    t.string   "priority"
    t.integer  "user_id"
    t.integer  "documentcategories_id"
  end

  add_index "activities", ["activity_category_id"], name: "index_activities_on_activity_category_id", using: :btree
  add_index "activities", ["documentcategories_id"], name: "index_activities_on_documentcategories_id", using: :btree
  add_index "activities", ["project_id"], name: "index_activities_on_project_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "activity_categories", force: true do |t|
    t.string   "categoryName"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activityCategoryName"
  end

  create_table "document_categories", force: true do |t|
    t.string   "categoryName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "fileLocation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "document_category_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "version"
    t.integer  "versionMinor"
  end

  add_index "documents", ["document_category_id"], name: "index_documents_on_document_category_id", using: :btree
  add_index "documents", ["project_id"], name: "index_documents_on_project_id", using: :btree

  create_table "issues", force: true do |t|
    t.string   "issueName"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "activity_id"
    t.integer  "project_id"
  end

  add_index "issues", ["activity_id"], name: "index_issues_on_activity_id", using: :btree
  add_index "issues", ["project_id"], name: "index_issues_on_project_id", using: :btree

  create_table "project_teams", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "project_teams", ["project_id", "user_id"], name: "index_project_teams_on_project_id_and_user_id", unique: true, using: :btree
  add_index "project_teams", ["project_id"], name: "index_project_teams_on_project_id", using: :btree
  add_index "project_teams", ["user_id"], name: "index_project_teams_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "projectName"
    t.text     "description"
    t.date     "startDate"
    t.date     "endDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "roleName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "phoneNo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "firstName"
    t.string   "lastName"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

end
