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

ActiveRecord::Schema.define(version: 20151223081052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absences", force: :cascade do |t|
    t.integer  "student_attendance_register_id"
    t.integer  "absentee_id"
    t.string   "absentee_type"
    t.string   "leave_type"
    t.string   "reason"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "absences", ["absentee_type", "absentee_id"], name: "index_absences_on_absentee_type_and_absentee_id", using: :btree
  add_index "absences", ["student_attendance_register_id"], name: "index_absences_on_student_attendance_register_id", using: :btree

  create_table "batches", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "name"
    t.string   "code"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "batches", ["course_id"], name: "index_batches_on_course_id", using: :btree

  create_table "batches_examinations", id: false, force: :cascade do |t|
    t.integer "batch_id"
    t.integer "examination_id"
  end

  add_index "batches_examinations", ["batch_id"], name: "index_batches_examinations_on_batch_id", using: :btree
  add_index "batches_examinations", ["examination_id"], name: "index_batches_examinations_on_examination_id", using: :btree

  create_table "class_timings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_types", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "course_types", ["department_id"], name: "index_course_types_on_department_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.integer  "course_type_id"
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "term_structure_id"
  end

  add_index "courses", ["course_type_id"], name: "index_courses_on_course_type_id", using: :btree
  add_index "courses", ["term_structure_id"], name: "index_courses_on_term_structure_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designations", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "districts", ["state_id"], name: "index_districts_on_state_id", using: :btree

  create_table "exam_registrations", force: :cascade do |t|
    t.integer  "examination_id"
    t.integer  "student_id"
    t.integer  "paper_count"
    t.float    "fees_paid"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "register_no"
  end

  add_index "exam_registrations", ["examination_id"], name: "index_exam_registrations_on_examination_id", using: :btree
  add_index "exam_registrations", ["student_id"], name: "index_exam_registrations_on_student_id", using: :btree

  create_table "examinations", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "syllabus_id"
    t.integer  "term_structure_entry_id"
    t.string   "name"
    t.string   "code"
    t.date     "registration_open_date"
    t.date     "registration_close_date"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "examinations", ["course_id"], name: "index_examinations_on_course_id", using: :btree
  add_index "examinations", ["syllabus_id"], name: "index_examinations_on_syllabus_id", using: :btree
  add_index "examinations", ["term_structure_entry_id"], name: "index_examinations_on_term_structure_entry_id", using: :btree

  create_table "internal_marks", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "term_structure_entry_id"
    t.integer  "paper_id"
    t.float    "mark"
    t.integer  "created_by_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "internal_marks", ["paper_id"], name: "index_internal_marks_on_paper_id", using: :btree
  add_index "internal_marks", ["student_id"], name: "index_internal_marks_on_student_id", using: :btree
  add_index "internal_marks", ["term_structure_entry_id"], name: "index_internal_marks_on_term_structure_entry_id", using: :btree

  create_table "marks", force: :cascade do |t|
    t.integer  "registered_exam_paper_id"
    t.float    "mark"
    t.integer  "entered_by_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "marks", ["registered_exam_paper_id"], name: "index_marks_on_registered_exam_paper_id", using: :btree

  create_table "optional_paper_enrollments", force: :cascade do |t|
    t.integer  "batch_id"
    t.integer  "student_id"
    t.integer  "paper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "optional_paper_enrollments", ["batch_id"], name: "index_optional_paper_enrollments_on_batch_id", using: :btree
  add_index "optional_paper_enrollments", ["paper_id"], name: "index_optional_paper_enrollments_on_paper_id", using: :btree
  add_index "optional_paper_enrollments", ["student_id"], name: "index_optional_paper_enrollments_on_student_id", using: :btree

  create_table "paper_assignments", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "paper_id"
    t.integer  "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "paper_assignments", ["batch_id"], name: "index_paper_assignments_on_batch_id", using: :btree
  add_index "paper_assignments", ["paper_id"], name: "index_paper_assignments_on_paper_id", using: :btree
  add_index "paper_assignments", ["teacher_id"], name: "index_paper_assignments_on_teacher_id", using: :btree

  create_table "paper_types", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", force: :cascade do |t|
    t.integer  "paper_type_id"
    t.string   "name"
    t.string   "code"
    t.string   "study_mode"
    t.boolean  "exam_required"
    t.boolean  "optional"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "offered_by_id"
    t.float    "max_internal_mark"
    t.float    "max_external_mark"
    t.integer  "pass_percent"
  end

  add_index "papers", ["paper_type_id"], name: "index_papers_on_paper_type_id", using: :btree

  create_table "periods", force: :cascade do |t|
    t.integer  "class_timing_id"
    t.string   "name"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "is_break"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "periods", ["class_timing_id"], name: "index_periods_on_class_timing_id", using: :btree

  create_table "programme_offerings", force: :cascade do |t|
    t.integer  "syllabus_id"
    t.integer  "paper_id"
    t.integer  "term_structure_entry_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "programme_offerings", ["paper_id"], name: "index_programme_offerings_on_paper_id", using: :btree
  add_index "programme_offerings", ["syllabus_id"], name: "index_programme_offerings_on_syllabus_id", using: :btree
  add_index "programme_offerings", ["term_structure_entry_id"], name: "index_programme_offerings_on_term_structure_entry_id", using: :btree

  create_table "registered_exam_papers", force: :cascade do |t|
    t.integer  "exam_registration_id"
    t.integer  "paper_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "registered_exam_papers", ["exam_registration_id"], name: "index_registered_exam_papers_on_exam_registration_id", using: :btree
  add_index "registered_exam_papers", ["paper_id"], name: "index_registered_exam_papers_on_paper_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "activities", default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "country_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_attendance_registers", force: :cascade do |t|
    t.integer  "batch_id"
    t.integer  "user_id"
    t.integer  "period_id"
    t.date     "marked_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "student_attendance_registers", ["batch_id"], name: "index_student_attendance_registers_on_batch_id", using: :btree
  add_index "student_attendance_registers", ["period_id"], name: "index_student_attendance_registers_on_period_id", using: :btree
  add_index "student_attendance_registers", ["user_id"], name: "index_student_attendance_registers_on_user_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "batch_id"
    t.string   "admission_no"
    t.string   "roll_no"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "students", ["batch_id"], name: "index_students_on_batch_id", using: :btree

  create_table "syllabuses", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "syllabuses", ["course_id"], name: "index_syllabuses_on_course_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.integer  "department_id"
    t.integer  "designation_id"
    t.string   "employee_no"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "teachers", ["department_id"], name: "index_teachers_on_department_id", using: :btree
  add_index "teachers", ["designation_id"], name: "index_teachers_on_designation_id", using: :btree

  create_table "term_dates", force: :cascade do |t|
    t.integer  "batch_id"
    t.integer  "term_structure_entry_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "term_dates", ["batch_id"], name: "index_term_dates_on_batch_id", using: :btree
  add_index "term_dates", ["term_structure_entry_id"], name: "index_term_dates_on_term_structure_entry_id", using: :btree

  create_table "term_structure_entries", force: :cascade do |t|
    t.integer  "term_structure_id"
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "term_structure_entries", ["term_structure_id"], name: "index_term_structure_entries_on_term_structure_id", using: :btree

  create_table "term_structures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timetable_entries", force: :cascade do |t|
    t.integer  "timetable_id"
    t.integer  "period_id"
    t.integer  "teacher_id"
    t.integer  "paper_id"
    t.integer  "wday"
    t.boolean  "default"
    t.integer  "created_by_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "timetable_entries", ["paper_id"], name: "index_timetable_entries_on_paper_id", using: :btree
  add_index "timetable_entries", ["period_id"], name: "index_timetable_entries_on_period_id", using: :btree
  add_index "timetable_entries", ["teacher_id"], name: "index_timetable_entries_on_teacher_id", using: :btree
  add_index "timetable_entries", ["timetable_id"], name: "index_timetable_entries_on_timetable_id", using: :btree

  create_table "timetables", force: :cascade do |t|
    t.integer  "class_timing_id"
    t.integer  "batch_id"
    t.integer  "term_structure_entry_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "timetables", ["batch_id"], name: "index_timetables_on_batch_id", using: :btree
  add_index "timetables", ["class_timing_id"], name: "index_timetables_on_class_timing_id", using: :btree
  add_index "timetables", ["term_structure_entry_id"], name: "index_timetables_on_term_structure_entry_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "profile_id"
    t.string   "profile_type"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "dp"
    t.date     "dob"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "religion"
    t.string   "nationality_id"
    t.string   "mobile_no"
    t.string   "phone_no"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "post_office"
    t.string   "taluk"
    t.string   "pincode"
    t.string   "country_id"
    t.string   "comm_address_line1"
    t.string   "comm_address_line2"
    t.string   "comm_post_office"
    t.string   "comm_taluk"
    t.string   "comm_pincode"
    t.string   "comm_country_id"
    t.integer  "district_id"
    t.integer  "state_id"
    t.integer  "comm_district_id"
    t.integer  "comm_state_id"
  end

  add_index "users", ["comm_district_id"], name: "index_users_on_comm_district_id", using: :btree
  add_index "users", ["comm_state_id"], name: "index_users_on_comm_state_id", using: :btree
  add_index "users", ["district_id"], name: "index_users_on_district_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_type", "profile_id"], name: "index_users_on_profile_type_and_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["state_id"], name: "index_users_on_state_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "absences", "student_attendance_registers"
  add_foreign_key "batches", "courses"
  add_foreign_key "batches_examinations", "batches"
  add_foreign_key "batches_examinations", "examinations"
  add_foreign_key "course_types", "departments"
  add_foreign_key "courses", "course_types"
  add_foreign_key "courses", "term_structures"
  add_foreign_key "districts", "states"
  add_foreign_key "exam_registrations", "examinations"
  add_foreign_key "exam_registrations", "students"
  add_foreign_key "examinations", "courses"
  add_foreign_key "examinations", "syllabuses"
  add_foreign_key "examinations", "term_structure_entries"
  add_foreign_key "internal_marks", "papers"
  add_foreign_key "internal_marks", "students"
  add_foreign_key "internal_marks", "term_structure_entries"
  add_foreign_key "marks", "registered_exam_papers"
  add_foreign_key "optional_paper_enrollments", "batches"
  add_foreign_key "optional_paper_enrollments", "papers"
  add_foreign_key "optional_paper_enrollments", "students"
  add_foreign_key "paper_assignments", "batches"
  add_foreign_key "paper_assignments", "papers"
  add_foreign_key "paper_assignments", "teachers"
  add_foreign_key "papers", "paper_types"
  add_foreign_key "periods", "class_timings"
  add_foreign_key "programme_offerings", "papers"
  add_foreign_key "programme_offerings", "syllabuses"
  add_foreign_key "programme_offerings", "term_structure_entries"
  add_foreign_key "registered_exam_papers", "exam_registrations"
  add_foreign_key "registered_exam_papers", "papers"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
  add_foreign_key "student_attendance_registers", "batches"
  add_foreign_key "student_attendance_registers", "periods"
  add_foreign_key "student_attendance_registers", "users"
  add_foreign_key "students", "batches"
  add_foreign_key "syllabuses", "courses"
  add_foreign_key "teachers", "departments"
  add_foreign_key "teachers", "designations"
  add_foreign_key "term_dates", "batches"
  add_foreign_key "term_dates", "term_structure_entries"
  add_foreign_key "term_structure_entries", "term_structures"
  add_foreign_key "timetable_entries", "papers"
  add_foreign_key "timetable_entries", "periods"
  add_foreign_key "timetable_entries", "teachers"
  add_foreign_key "timetable_entries", "timetables"
  add_foreign_key "timetables", "batches"
  add_foreign_key "timetables", "class_timings"
  add_foreign_key "timetables", "term_structure_entries"
end
