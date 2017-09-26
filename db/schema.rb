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

ActiveRecord::Schema.define(version: 20170926234810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series", force: :cascade do |t|
    t.datetime "scheduled_date"
    t.datetime "target_begin_date"
    t.datetime "target_end_date"
    t.boolean "completed", default: false
    t.datetime "recorded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_series", force: :cascade do |t|
    t.integer "team_id"
    t.integer "series_id"
    t.integer "team_approved_user_id"
    t.datetime "team_approved_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.boolean "is_active", default: true
    t.boolean "is_banned", default: false
    t.boolean "is_deleted", default: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "slug"
    t.integer "group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "steamid"
    t.string "avatar"
    t.boolean "is_active", default: true
    t.boolean "is_deleted", default: false
    t.boolean "is_banned", default: false
    t.datetime "lastseen"
    t.string "personaname"
    t.string "loccountrycode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.boolean "team_admin", default: false
    t.boolean "team_captain", default: false
    t.string "profileurl"
    t.boolean "team_join_approved", default: false
    t.datetime "team_join_date"
    t.integer "team_join_approved_by"
    t.boolean "is_global_admin", default: false
    t.boolean "is_league_admin", default: false
    t.boolean "is_league_caster", default: false
    t.boolean "is_match_admin", default: false
    t.integer "opendota_solo_mmr"
    t.integer "opendota_party_mmr"
    t.integer "opendota_estimated_mmr"
    t.datetime "opendota_mmr_updated"
    t.integer "smurf_check", default: 0
    t.integer "in_house_elo"
  end

end
