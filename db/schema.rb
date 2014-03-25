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

ActiveRecord::Schema.define(version: 20140325140254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: true do |t|
    t.string   "key"
    t.text     "secret"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_tests", force: true do |t|
    t.date     "taken_on"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "hb"
    t.float    "mcv"
    t.float    "wbc"
    t.float    "platelets"
    t.float    "neutrophils"
    t.float    "lymphocytes"
    t.float    "alt"
    t.float    "alk_phos"
    t.float    "creatinine"
    t.float    "esr"
    t.string   "crp"
  end

end
