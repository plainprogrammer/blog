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

ActiveRecord::Schema[8.0].define(version: 2025_01_20_021815) do
  create_table "cv_educations", force: :cascade do |t|
    t.integer "to_month"
    t.integer "to_year"
    t.string "institution"
    t.string "degree"
  end

  create_table "cv_work_tenures", force: :cascade do |t|
    t.integer "from_month", null: false
    t.integer "from_year", null: false
    t.integer "to_month"
    t.integer "to_year"
    t.boolean "to_present", default: false
    t.string "employer", null: false
  end
end
