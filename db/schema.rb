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

ActiveRecord::Schema.define(version: 20180406011728) do

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "isbn"
    t.integer  "publish_year"
    t.string   "genre"
    t.string   "subject"
    t.string   "language"
    t.string   "image_url"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "featured",     default: false
    t.index ["author"], name: "index_books_on_author"
    t.index ["genre"], name: "index_books_on_genre"
    t.index ["publish_year"], name: "index_books_on_publish_year"
    t.index ["title"], name: "index_books_on_title", unique: true
  end

  create_table "holds", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "request_date"
    t.datetime "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["book_id"], name: "index_holds_on_book_id"
    t.index ["user_id"], name: "index_holds_on_user_id"
  end

  create_table "loans", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "date_borrowed"
    t.datetime "due_date"
    t.datetime "date_returned"
    t.integer  "renewed_count"
    t.boolean  "overdue"
    t.decimal  "fine"
    t.datetime "fine_paid_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["book_id"], name: "index_loans_on_book_id"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "user_books", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_user_books_on_book_id"
    t.index ["user_id"], name: "index_user_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "account_status",         default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
