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

ActiveRecord::Schema.define(version: 20170611073317) do

  create_table "retinas", force: :cascade do |t|
    t.integer  "hba1c"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "lipid_profile"
    t.integer  "kidney_renal"
    t.integer  "kidney_micro_album"
    t.integer  "kidney_creatinine"
    t.integer  "smoking"
    t.integer  "smoking_related_lung_disease"
    t.integer  "diabetic_duration"
    t.integer  "cad_stroke"
    t.integer  "good_follow_up"
  end

end
