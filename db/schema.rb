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

ActiveRecord::Schema.define(version: 2020_03_18_213700) do

  create_table "achievements", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "achievement_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_achievements_on_user_id"
  end

  create_table "commands", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "command_no", null: false
    t.integer "command_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "command_no"], name: "index_commands_on_user_id_and_command_no", unique: true
    t.index ["user_id"], name: "index_commands_on_user_id"
  end

  create_table "conscription_commands", force: :cascade do |t|
    t.integer "command_id", null: false
    t.integer "soldier_rank", null: false
    t.integer "soldier_type", null: false
    t.integer "soldier_num", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["command_id"], name: "index_conscription_commands_on_command_id", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "main_color", null: false
    t.string "sub_color", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "period", null: false
    t.integer "year", null: false
    t.integer "month", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "skill_type", null: false
    t.integer "level", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "soldiers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "rank", null: false
    t.integer "soldier_type", null: false
    t.integer "num", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_soldiers_on_user_id"
  end

  create_table "town_defences", force: :cascade do |t|
    t.integer "town_id", null: false
    t.integer "user_id", null: false
    t.integer "order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["town_id"], name: "index_town_defences_on_town_id"
    t.index ["user_id"], name: "index_town_defences_on_user_id"
  end

  create_table "towns", force: :cascade do |t|
    t.string "name", null: false
    t.integer "country_id"
    t.integer "x", null: false
    t.integer "y", null: false
    t.integer "level", null: false
    t.integer "farmer", null: false
    t.integer "allegiance", null: false
    t.integer "max_agriculture", null: false
    t.integer "agriculture", null: false
    t.integer "max_commerce", null: false
    t.integer "commerce", null: false
    t.integer "technology", null: false
    t.integer "max_wall", null: false
    t.integer "wall", null: false
    t.integer "wall_durability", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
    t.integer "formation", null: false
    t.integer "training", null: false
    t.integer "country_id", null: false
    t.integer "gold", null: false
    t.integer "rice", null: false
    t.integer "contributing", null: false
    t.integer "rank", null: false
    t.float "arm", null: false
    t.float "guard", null: false
    t.float "book", null: false
    t.float "flag", null: false
    t.integer "delete_turn", null: false
    t.integer "town_id", null: false
    t.string "email", null: false
    t.integer "update_time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["town_id"], name: "index_users_on_town_id"
  end

  create_table "war_commands", force: :cascade do |t|
    t.integer "command_id", null: false
    t.integer "town_id", null: false
    t.integer "mode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["command_id"], name: "index_war_commands_on_command_id", unique: true
  end

  add_foreign_key "commands", "users"
  add_foreign_key "conscription_commands", "commands", on_delete: :cascade
  add_foreign_key "skills", "users"
  add_foreign_key "soldiers", "users"
  add_foreign_key "town_defences", "towns"
  add_foreign_key "town_defences", "users"
  add_foreign_key "users", "countries"
  add_foreign_key "users", "towns"
  add_foreign_key "war_commands", "commands", on_delete: :cascade
end
