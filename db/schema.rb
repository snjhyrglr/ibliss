# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_06_050059) do
  create_table "beneficiaries", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "insured_id", null: false
    t.string "name"
    t.date "date_of_birth"
    t.string "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insured_id"], name: "index_beneficiaries_on_insured_id"
  end

  create_table "cooperative_branches", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cooperative_id", null: false
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_cooperative_branches_on_cooperative_id"
  end

  create_table "cooperatives", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "abbreviation"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dependents", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "insured_id", null: false
    t.string "name"
    t.date "date_of_birth"
    t.string "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insured_id"], name: "index_dependents_on_insured_id"
  end

  create_table "insureds", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cooperative_id"
    t.bigint "cooperative_branch_id"
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "suffix"
    t.date "birthdate"
    t.string "gender"
    t.integer "age"
    t.string "civil_status"
    t.string "place_of_birth"
    t.string "id_type"
    t.string "id_no"
    t.string "nationality"
    t.string "address"
    t.string "height"
    t.string "weight"
    t.string "contact_no"
    t.string "source_of_income"
    t.string "business_address"
    t.string "tel_no"
    t.string "member_since"
    t.decimal "premium", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_branch_id"], name: "index_insureds_on_cooperative_branch_id"
    t.index ["cooperative_id"], name: "index_insureds_on_cooperative_id"
  end

  create_table "occupations", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "insured_id"
    t.string "name"
    t.string "employer_name"
    t.string "employer_address"
    t.string "business_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insured_id"], name: "index_occupations_on_insured_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "username"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "beneficiaries", "insureds"
  add_foreign_key "cooperative_branches", "cooperatives"
  add_foreign_key "dependents", "insureds"
end
