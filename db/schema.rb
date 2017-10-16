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

ActiveRecord::Schema.define(version: 20171016174917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.string "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
  end

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

  create_table "generic_uploads", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inhouse_match_players", force: :cascade do |t|
    t.integer "inhouse_match_id"
    t.integer "user_id"
    t.integer "starting_elo"
    t.integer "elo_change"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inhouse_matches", force: :cascade do |t|
    t.integer "match_id"
    t.integer "recorded_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "screenshot_file_name"
    t.string "screenshot_content_type"
    t.integer "screenshot_file_size"
    t.datetime "screenshot_updated_at"
  end

  create_table "league_settings", force: :cascade do |t|
    t.integer "team_cost_usd"
    t.integer "party_mmr_ceiling"
    t.integer "solo_mmr_ceiling"
    t.integer "max_teams"
    t.integer "max_players"
    t.integer "max_players_per_team"
    t.boolean "allow_team_creation", default: true
    t.boolean "allow_player_registration", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "payment_description"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "resource_type"
    t.integer "resource_id"
    t.boolean "is_read", default: false
    t.datetime "seen_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "shortname"
    t.text "contents"
    t.integer "user_id"
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
    t.integer "admin_user_id"
    t.integer "caster_user_id"
  end

  create_table "series_matches", force: :cascade do |t|
    t.bigint "series_id"
    t.integer "match_id"
    t.integer "winning_team_id"
    t.integer "losing_team_id"
    t.string "vod_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_series_matches_on_series_id"
  end

  create_table "series_messages", force: :cascade do |t|
    t.integer "series_id"
    t.integer "user_id"
    t.text "message"
    t.boolean "is_deleted", default: false
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
    t.boolean "is_paid", default: false
    t.string "paid_amount"
    t.integer "paid_by"
    t.datetime "paid_on", default: "2017-10-16 17:41:16"
    t.string "paid_stripe_token"
    t.string "paid_stripe_token_type"
    t.string "paid_stripe_email"
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
    t.integer "in_house_wins", default: 0
    t.integer "in_house_losses", default: 0
    t.integer "chat_room_id"
    t.boolean "lobby_ready_state", default: false
  end

  add_foreign_key "chat_rooms", "users"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "series_matches", "series"
end
