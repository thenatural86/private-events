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

ActiveRecord::Schema[8.0].define(version: 2025_03_24_213618) do
  create_table "event_attendances", force: :cascade do |t|
    t.integer "attendee_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_event_attendances_on_attendee_id"
    t.index ["event_id"], name: "index_event_attendances_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id", null: false
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_attendances", "attendees"
  add_foreign_key "event_attendances", "events"
  add_foreign_key "events", "users", column: "creator_id"
end
