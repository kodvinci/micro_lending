# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120710170641) do

  create_table "badge_lists", :force => true do |t|
    t.integer  "luid"
    t.integer  "bid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "badges", :force => true do |t|
    t.integer  "bid"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "borrowers", :force => true do |t|
    t.integer  "buid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "category"
    t.text     "description"
    t.integer  "sum"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "pic_url"
  end

  create_table "decision_logs", :force => true do |t|
    t.integer  "luid"
    t.integer  "decision_id"
    t.integer  "story_id"
    t.string   "note"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "decision_objects", :force => true do |t|
    t.text     "description"
    t.text     "requirements"
    t.integer  "story_object_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "to_story_id"
    t.text     "hints"
  end

  add_index "decision_objects", ["story_object_id"], :name => "index_decision_objects_on_story_object_id"

  create_table "decision_tests", :force => true do |t|
    t.text     "description"
    t.integer  "story_test_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "decision_tests", ["story_test_id"], :name => "index_decision_tests_on_story_test_id"

  create_table "decisions", :force => true do |t|
    t.integer  "decision_id"
    t.text     "description"
    t.text     "conditions"
    t.integer  "decision_destination"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "event_logs", :force => true do |t|
    t.integer  "luid"
    t.text     "event"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lenders", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "class_type", :default => "Noobie"
    t.integer  "user_id"
    t.decimal  "credit",     :default => 0.0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "luid"
    t.string   "gender"
    t.decimal  "exp",        :default => 1.0
  end

  create_table "paypaltransactions", :force => true do |t|
    t.integer  "uid",        :null => false
    t.string   "payKey",     :null => false
    t.decimal  "amount",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "story_choices", :force => true do |t|
    t.integer  "sid"
    t.text     "choices"
    t.integer  "mapping"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "story_objects", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "story_tests", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "luid"
    t.integer  "buid"
    t.decimal  "amount"
    t.datetime "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_decisions", :force => true do |t|
    t.integer  "luid"
    t.integer  "story_id"
    t.integer  "decision_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "uid",                    :limit => 255
    t.string   "class_type",                            :default => "Noobie"
    t.string   "email",                                 :default => "",       :null => false
    t.string   "encrypted_password",                    :default => "",       :null => false
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.decimal  "exp",                                   :default => 1.0
    t.boolean  "admin",                                 :default => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
