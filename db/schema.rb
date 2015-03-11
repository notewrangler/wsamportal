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

ActiveRecord::Schema.define(version: 20150307201516) do

  create_table "jhooks", force: true do |t|
    t.integer  "job_id"
    t.integer  "agent_id"
    t.string   "state"
    t.text     "comment"
    t.boolean  "team_lead"
    t.decimal  "wage_rate",  precision: 5, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    
  end

  create_table "jobs", force: true do |t|
    t.string   "job_num"
    t.string   "project"
    t.string   "store_num"
    t.string   "store_name"
    t.string   "address"
    t.string   "city"
    t.string   "state",      limit: 2
    t.string   "zip",        limit: 10
    t.string   "phone",      limit: 15
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "sat",                   default: false
    t.boolean  "sun",                   default: false
    t.time     "time"
    t.string   "timezone"
    t.integer  "sched_hrs"
    t.integer  "manpower"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "shifts", force: true do |t|
    t.integer  "job_id"
    t.date     "shift_date"
    t.integer  "hours"
    t.integer  "available_agents", default: 0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "shooks", force: true do |t|
    t.integer  "shift_id"
    t.integer  "agent_id"
    t.integer  "jhook_id"
    t.date     "date"
    t.string   "state"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    
        
  end

  create_table "timesheets", force: true do |t|
    t.integer  "agent_id"
    t.integer  "shook_id"
    t.string   "state"
    t.date     "date"
    t.time     "time_in"
    t.time     "time_out"
    t.integer  "break_minutes"
    t.decimal  "total_hrs",      precision: 3, scale: 1
    t.integer  "miles"
    t.decimal  "drive_time",     precision: 3, scale: 1
    t.decimal  "expenses",       precision: 5, scale: 2
    t.text     "comments"
    t.string   "contact"
    t.boolean  "team_lead_ok"
    t.text     "team_lead_note"
    t.boolean  "approved"    
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false   
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "role",                       default: "agent", null: false
    t.string   "type",                       default: "Agent", null: false
    t.string   "password_digest"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "address"
    t.string   "city"
    t.string   "state",           limit: 2
    t.string   "zip",             limit: 10
    t.string   "phone",           limit: 15
    t.string   "email",           limit: 50
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

end
