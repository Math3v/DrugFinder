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

ActiveRecord::Schema.define(:version => 20130502120525) do

  create_table "clicks", :id => false, :force => true do |t|
    t.string  "name",         :limit => 200
    t.integer "drug_id"
    t.integer "no_of_clicks", :limit => 8
  end

  add_index "clicks", ["drug_id"], :name => "clicks_idx"

  create_table "drugs", :id => false, :force => true do |t|
    t.string  "name",        :limit => 200
    t.integer "id"
    t.string  "code",        :limit => 200
    t.string  "label",       :limit => 6000
    t.string  "usage",       :limit => 3500
    t.boolean "admin"
    t.integer "producer_id"
    t.integer "holder_id"
    t.integer "supplier_id"
    t.string  "form",        :limit => 200
    t.string  "sukl_name",   :limit => 400
  end

  create_table "drugs_", :id => false, :force => true do |t|
    t.integer "id",                            :null => false
    t.string  "name",          :limit => 200
    t.string  "code",          :limit => 200
    t.string  "sukl_name_old", :limit => 200
    t.string  "label",         :limit => 6000
    t.string  "usage",         :limit => 3500
    t.boolean "admin"
    t.integer "producer_id"
    t.integer "holder_id"
    t.integer "supplier_id"
    t.string  "form",          :limit => 200
    t.string  "sukl_name",     :limit => 400
  end

  add_index "drugs_", ["id"], :name => "id_not_null_unique", :unique => true

  create_table "holders", :force => true do |t|
    t.string "name",       :limit => 400
    t.string "name_clean", :limit => 400
  end

  add_index "holders", ["id"], :name => "idx_holders_id"

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "producers", :force => true do |t|
    t.string "name",       :limit => 400
    t.string "name_clean", :limit => 400
  end

  add_index "producers", ["id"], :name => "idx_producers_id"

  create_table "searchers", :id => false, :force => true do |t|
    t.integer "id",                 :null => false
    t.string  "name", :limit => 20
  end

  create_table "statistics", :id => false, :force => true do |t|
    t.integer "id", :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string "name",       :limit => 400
    t.string "name_clean", :limit => 400
  end

  add_index "suppliers", ["id"], :name => "idx_suppliers_id"

  create_table "users", :force => true do |t|
    t.string  "name",           :limit => 20
    t.boolean "admin"
    t.integer "remember_token"
  end

end
