# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_04_104955) do

  create_table "users", force: :cascade do |t|
    t.string "character_id", null: false
    t.string "password_digest", null: false
    t.string "name", null: false
    t.string "image_path", null: false
    t.integer "strength", null: false
    t.integer "strength_exp", null: false
    t.integer "intelligence", null: false
    t.integer "intelligence_exp", null: false
    t.integer "leadership", null: false
    t.integer "leadership_exp", null: false
    t.integer "charm", null: false
    t.integer "charm_exp", null: false
    t.integer "soldier_num", null: false
    t.integer "training", null: false
    t.integer "country_id", null: false
    t.integer "gold", null: false
    t.integer "rice", null: false
    t.integer "contributing", null: false
    t.integer "rank", null: false
    t.integer "arm", null: false
    t.integer "guard", null: false
    t.integer "book", null: false
    t.integer "flag", null: false
    t.integer "delete_turn", null: false
    t.integer "position", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
