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

ActiveRecord::Schema[7.1].define(version: 2024_01_10_012618) do
  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "color_id", null: false
    t.integer "type_id", null: false
    t.integer "gender_id", null: false
    t.text "description"
    t.integer "status_id", null: false
    t.integer "size_id", null: false
    t.integer "condition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "brand"
    t.string "photo_link"
    t.index ["color_id"], name: "index_items_on_color_id"
    t.index ["condition_id"], name: "index_items_on_condition_id"
    t.index ["gender_id"], name: "index_items_on_gender_id"
    t.index ["size_id"], name: "index_items_on_size_id"
    t.index ["status_id"], name: "index_items_on_status_id"
    t.index ["type_id"], name: "index_items_on_type_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "colors"
  add_foreign_key "items", "conditions"
  add_foreign_key "items", "genders"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "statuses"
  add_foreign_key "items", "types"
end
