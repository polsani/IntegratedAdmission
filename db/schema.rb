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

ActiveRecord::Schema.define(version: 2018_11_09_020013) do

  create_table "emails", force: :cascade do |t|
    t.string "email"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_emails_on_student_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.decimal "value"
    t.integer "sequence"
    t.date "due_date"
    t.integer "registration_id"
    t.integer "payment_way_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_way_id"], name: "index_invoices_on_payment_way_id"
    t.index ["registration_id"], name: "index_invoices_on_registration_id"
  end

  create_table "payment_ways", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.decimal "value"
    t.integer "best_day_to_pay"
    t.integer "invoice_amount"
    t.integer "student_id"
    t.integer "payment_way_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_way_id"], name: "index_registrations_on_payment_way_id"
    t.index ["student_id"], name: "index_registrations_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "tax_id"
    t.integer "grade_enem"
    t.boolean "admission_approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
