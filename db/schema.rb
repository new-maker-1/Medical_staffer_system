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

ActiveRecord::Schema.define(version: 20170311104118) do

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "provider_id"
    t.integer  "site_id"
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.text     "status",                  limit: 65535
    t.text     "hide_from_schedule",      limit: 65535
    t.float    "custom_pay_rate",         limit: 24
    t.float    "custom_bill_rate",        limit: 24
    t.string   "area",                    limit: 32
    t.text     "note",                    limit: 65535
    t.string   "filledon",                limit: 32
    t.string   "create_on",               limit: 32
    t.integer  "access_id"
    t.string   "last_modified_by_x_on_y", limit: 32
    t.string   "color"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "providers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "rails"
    t.string   "last_name",                       limit: 32
    t.string   "first_name",                      limit: 32
    t.string   "preferred_name",                  limit: 32
    t.string   "middle_name",                     limit: 32
    t.string   "salutation",                      limit: 32
    t.string   "address",                         limit: 64
    t.string   "email",                           limit: 32
    t.text     "phone_number",                    limit: 65535
    t.text     "status",                          limit: 65535
    t.integer  "ssn"
    t.datetime "date_birth"
    t.string   "gender",                          limit: 16
    t.string   "spouse_name",                     limit: 32
    t.string   "place_birth",                     limit: 32
    t.string   "superviser",                      limit: 32
    t.datetime "hiredate"
    t.datetime "termination_date"
    t.string   "regidency",                       limit: 32
    t.string   "regidency_address",               limit: 32
    t.string   "regidency_degree",                limit: 32
    t.datetime "regidency_dates"
    t.string   "medical_education",               limit: 32
    t.string   "medical_education_city",          limit: 32
    t.string   "pre_med_education",               limit: 32
    t.string   "pre_med_education_city",          limit: 32
    t.string   "pre_med_degree",                  limit: 32
    t.datetime "pre_med_dates"
    t.datetime "initial_contact_date"
    t.datetime "application_received_date"
    t.datetime "cv_received_date"
    t.datetime "interview_date"
    t.datetime "date_verification"
    t.datetime "verification_completion_date"
    t.datetime "recertification_request_date"
    t.datetime "recertification_completion_date"
    t.string   "active_referral_options",         limit: 32
    t.datetime "date_hired"
    t.string   "referredby",                      limit: 32
    t.datetime "first_shift_date"
    t.datetime "referral_paid_date"
    t.integer  "amount"
    t.text     "notes",                           limit: 65535
    t.text     "referral_code",                   limit: 65535
    t.integer  "access_id"
    t.integer  "microstaffer_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "shifts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "provider_id"
    t.integer  "site_id"
    t.datetime "date"
    t.text     "shift",                   limit: 65535
    t.datetime "start_time"
    t.datetime "start_end"
    t.text     "status",                  limit: 65535
    t.text     "hide_from_schedule",      limit: 65535
    t.float    "custom_pay_rate",         limit: 24
    t.float    "custom_bill_rate",        limit: 24
    t.string   "area",                    limit: 32
    t.text     "note",                    limit: 65535
    t.string   "filledon",                limit: 32
    t.string   "create_on",               limit: 32
    t.integer  "access_id"
    t.string   "last_modified_by_x_on_y", limit: 32
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "hospital_name",              limit: 64
    t.string   "address",                    limit: 64
    t.string   "city",                       limit: 64
    t.text     "phone_number",               limit: 65535
    t.text     "fax_number",                 limit: 65535
    t.text     "po_box",                     limit: 65535
    t.string   "contacts_name",              limit: 16
    t.string   "contacts_description",       limit: 16
    t.string   "contacts_phone_number",      limit: 16
    t.string   "contacts_email",             limit: 16
    t.string   "contacts_send",              limit: 16
    t.string   "contacts_schedule",          limit: 16
    t.text     "certification_requirements", limit: 65535
    t.text     "notes",                      limit: 65535
    t.text     "housing_info",               limit: 65535
    t.string   "status_options",             limit: 32
    t.text     "dwc_contact_staff",          limit: 65535
    t.text     "affiliation",                limit: 65535
    t.text     "billing_address",            limit: 65535
    t.integer  "access_id"
    t.integer  "microstaffer_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "item_type",      limit: 191,        null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 4294967295
    t.datetime "created_at"
    t.text     "object_changes", limit: 65535
    t.string   "ip"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

end
