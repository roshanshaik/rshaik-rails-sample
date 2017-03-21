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

ActiveRecord::Schema.define(version: 20170308051601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parties", force: :cascade do |t|
    t.string   "host_name",   limit: 255
    t.string   "host_email",  limit: 255
    t.text     "guest_names"
    t.string   "venue",       limit: 255
    t.string   "location",    limit: 255
    t.string   "theme",       limit: 255
    t.integer  "numgsts",                 default: 0
    t.text     "descript"
    t.datetime "start_time"
    t.datetime "end_time"
  end

end
