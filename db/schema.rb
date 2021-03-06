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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161116121212) do

  create_table "categories", force: :cascade do |t|
    t.string  "name"
    t.integer "sub_id"
  end

  create_table "infos", force: :cascade do |t|
    t.string  "prenom"
    t.string  "nom"
    t.string  "mail"
    t.string  "tel"
    t.string  "addresse"
    t.string  "code_p"
    t.string  "inter_digi"
    t.string  "code_promo"
    t.integer "promo"
    t.integer "id_prod"
    t.string  "state"
    t.integer "total"
    t.integer "id_pro"
  end

  create_table "pros", force: :cascade do |t|
    t.string  "nom"
    t.string  "prenom"
    t.string  "entreprise"
    t.string  "addresse"
    t.string  "cate"
    t.string  "telephone"
    t.text    "entre_addr"
    t.integer "CIRET"
    t.string  "mail"
    t.string  "photo"
  end

  add_index "pros", ["id"], name: "sqlite_autoindex_pros_1", unique: true

  create_table "sites", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.string   "image"
    t.integer  "min_price"
    t.integer  "max_price"
    t.string   "time"
    t.text     "def"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "sites", ["category_id"], name: "index_sites_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.text   "password_digest"
  end

end
