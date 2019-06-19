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

ActiveRecord::Schema.define(version: 20190619075938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "broadcaster_campaigns", force: :cascade do |t|
    t.string   "publisher_type"
    t.integer  "publisher_id"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["publisher_id", "publisher_type", "label"], name: "index_broadcaster_campaign_on_publisher_and_label", unique: true, using: :btree
    t.index ["publisher_type", "publisher_id"], name: "index_broadcaster_campaigns_on_publisher_type_and_publisher_id", using: :btree
  end

  create_table "broadcaster_subscriptions", force: :cascade do |t|
    t.string   "subscriber_type"
    t.integer  "subscriber_id"
    t.integer  "broadcaster_campaign_id"
    t.string   "unsubscribe_token"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["broadcaster_campaign_id"], name: "index_broadcaster_subscriptions_on_broadcaster_campaign_id", using: :btree
    t.index ["subscriber_id", "subscriber_type", "broadcaster_campaign_id"], name: "index_broadcaster_subscriptions_on_subscriber_campaign", unique: true, using: :btree
    t.index ["subscriber_type", "subscriber_id"], name: "index_subscriptions_on_subscriber", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
