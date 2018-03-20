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

ActiveRecord::Schema.define(version: 20180319064722) do

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "message"
    t.bigint "invited_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["invited_id"], name: "index_events_on_invited_id"
  end

  create_table "friendships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships_groups", primary_key: ["friendship_id", "group_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "friendship_id", default: 0, null: false
    t.bigint "group_id", default: 0, null: false
    t.index ["friendship_id"], name: "index_friendships_groups_on_friendship_id"
    t.index ["group_id"], name: "index_friendships_groups_on_group_id"
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "inviteds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_inviteds_on_order_id"
    t.index ["user_id"], name: "index_inviteds_on_user_id"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "amount"
    t.integer "price"
    t.string "comment"
    t.bigint "joined_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["joined_id"], name: "index_items_on_joined_id"
  end

  create_table "joineds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_joineds_on_order_id"
    t.index ["user_id"], name: "index_joineds_on_user_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "orderType"
    t.string "place"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Menu_file_name"
    t.string "Menu_content_type"
    t.integer "Menu_file_size"
    t.datetime "Menu_updated_at"
    t.boolean "status"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "uimage_file_name"
    t.string "uimage_content_type"
    t.integer "uimage_file_size"
    t.datetime "uimage_updated_at"
    t.string "provider"
    t.string "uid"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "auth_token"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "inviteds"
  add_foreign_key "groups", "users"
  add_foreign_key "inviteds", "orders"
  add_foreign_key "inviteds", "users"
  add_foreign_key "items", "joineds"
  add_foreign_key "joineds", "orders"
  add_foreign_key "joineds", "users"
  add_foreign_key "orders", "users"
end
