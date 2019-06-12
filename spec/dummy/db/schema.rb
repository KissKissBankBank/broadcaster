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

ActiveRecord::Schema.define(version: 20171009130617) do

  create_table "event_store_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "stream",                   null: false
    t.string   "event_type",               null: false
    t.string   "event_id",                 null: false
    t.text     "metadata",   limit: 65535
    t.text     "data",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.index ["created_at"], name: "index_event_store_events_on_created_at", using: :btree
    t.index ["event_id"], name: "index_event_store_events_on_event_id", unique: true, using: :btree
    t.index ["event_type"], name: "index_event_store_events_on_event_type", using: :btree
    t.index ["stream"], name: "index_event_store_events_on_stream", using: :btree
  end

  create_table "papers_please_batch_state_transitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "batch_id"
    t.datetime "created_at"
    t.string   "to_state"
    t.text     "metadata",    limit: 65535
    t.integer  "sort_key"
    t.boolean  "most_recent"
    t.datetime "updated_at",                null: false
    t.index ["batch_id"], name: "index_papers_please_batch_state_transitions_on_batch_id", using: :btree
  end

  create_table "papers_please_batches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "state",             default: "pending", null: false
    t.datetime "send_at"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
    t.integer  "original_size"
    t.string   "original_filename"
    t.string   "uuid",                                  null: false
    t.index ["uuid"], name: "index_papers_please_batches_on_uuid", unique: true, using: :btree
  end

  create_table "papers_please_document_state_transitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "document_id"
    t.datetime "created_at"
    t.string   "to_state"
    t.text     "metadata",    limit: 65535
    t.integer  "sort_key"
    t.boolean  "most_recent"
    t.datetime "updated_at",                null: false
    t.index ["document_id"], name: "index_papers_please_document_state_transitions_on_document_id", using: :btree
  end

  create_table "papers_please_documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "file"
    t.string   "state",             default: "empty", null: false
    t.integer  "slot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                              null: false
    t.integer  "original_size"
    t.string   "original_filename"
    t.integer  "batch_id"
    t.string   "upload_name"
    t.string   "uuid",                                null: false
    t.index ["active"], name: "index_papers_please_documents_on_active", using: :btree
    t.index ["batch_id"], name: "index_papers_please_documents_on_batch_id", using: :btree
    t.index ["slot_id"], name: "index_papers_please_documents_on_slot_id", using: :btree
    t.index ["uuid"], name: "index_papers_please_documents_on_uuid", unique: true, using: :btree
  end

  create_table "papers_please_notification_state_transitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "notification_id"
    t.datetime "created_at"
    t.string   "to_state"
    t.text     "metadata",        limit: 65535
    t.integer  "sort_key"
    t.boolean  "most_recent"
    t.datetime "updated_at",                    null: false
    t.index ["notification_id"], name: "index_papers_please_notification_state_transitions_on_notif", using: :btree
  end

  create_table "papers_please_notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "why"
    t.string   "state",      default: "pending", null: false
    t.integer  "stack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid",                           null: false
    t.index ["stack_id"], name: "index_papers_please_notifications_on_stack_id", using: :btree
    t.index ["uuid"], name: "index_papers_please_notifications_on_uuid", unique: true, using: :btree
    t.index ["why"], name: "index_papers_please_notifications_on_why", using: :btree
  end

  create_table "papers_please_rejections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "reason"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "provider_data", limit: 65535
    t.string   "uuid",                        null: false
    t.string   "who_name"
    t.index ["document_id"], name: "index_papers_please_rejections_on_document_id", using: :btree
    t.index ["uuid"], name: "index_papers_please_rejections_on_uuid", unique: true, using: :btree
  end

  create_table "papers_please_slot_state_transitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "slot_id"
    t.datetime "created_at"
    t.string   "to_state"
    t.text     "metadata",    limit: 65535
    t.integer  "sort_key"
    t.boolean  "most_recent"
    t.datetime "updated_at",                null: false
    t.index ["slot_id"], name: "index_papers_please_slot_state_transitions_on_slot_id", using: :btree
  end

  create_table "papers_please_slots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "state",                    default: "empty", null: false
    t.integer  "stack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind",                     default: "other", null: false
    t.integer  "origin_id"
    t.string   "origin_type"
    t.string   "uuid",                                       null: false
    t.boolean  "provider_should_validate", default: true,    null: false
    t.index ["stack_id"], name: "index_papers_please_slots_on_stack_id", using: :btree
    t.index ["uuid"], name: "index_papers_please_slots_on_uuid", unique: true, using: :btree
  end

  create_table "papers_please_stack_state_transitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "stack_id"
    t.datetime "created_at"
    t.string   "to_state"
    t.text     "metadata",    limit: 65535
    t.integer  "sort_key"
    t.boolean  "most_recent"
    t.datetime "updated_at",                null: false
    t.index ["stack_id"], name: "index_papers_please_stack_state_transitions_on_stack_id", using: :btree
  end

  create_table "papers_please_stacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "state",       default: "pending", null: false
    t.string   "papers_type"
    t.integer  "papers_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid",                            null: false
    t.index ["papers_type", "papers_id"], name: "index_papers_please_stacks_on_papers_type_and_papers_id", using: :btree
    t.index ["uuid"], name: "index_papers_please_stacks_on_uuid", unique: true, using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",      null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",      null: false
    t.string   "iban"
    t.string   "bic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
