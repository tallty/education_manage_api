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

ActiveRecord::Schema.define(version: 20161206013125) do

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "picture_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "admin_user_tasks", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "user_task_id"
    t.decimal  "score",        precision: 5, scale: 2
    t.text     "comment"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "admin_user_tasks", ["admin_id"], name: "index_admin_user_tasks_on_admin_id"
  add_index "admin_user_tasks", ["user_task_id"], name: "index_admin_user_tasks_on_user_task_id"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.string   "qq"
    t.string   "mobile"
    t.string   "state"
    t.string   "phone"
    t.string   "address"
    t.string   "postcode"
    t.text     "remark"
    t.string   "username"
    t.integer  "adminable_id"
    t.string   "adminable_type"
    t.integer  "school_id"
    t.string   "authentication_token",   limit: 30
  end

  add_index "admins", ["authentication_token"], name: "index_admins_on_authentication_token", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  add_index "admins", ["username"], name: "index_admins_on_username", unique: true

  create_table "appraises", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "teacher_id"
    t.text     "remark"
    t.string   "degree"
    t.integer  "training_course_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "appraises", ["teacher_id"], name: "index_appraises_on_teacher_id"
  add_index "appraises", ["training_course_id"], name: "index_appraises_on_training_course_id"
  add_index "appraises", ["user_id"], name: "index_appraises_on_user_id"

  create_table "attachments", force: :cascade do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "attachmentable_id"
    t.string   "attachmentable_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "attachments", ["attachmentable_id", "attachmentable_type"], name: "index_attachments_on_attachmentable_id_and_attachmentable_type", unique: true

  create_table "course_resources", force: :cascade do |t|
    t.string   "title"
    t.text     "remark"
    t.integer  "training_course_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "course_resources", ["training_course_id"], name: "index_course_resources_on_training_course_id"

  create_table "divides", force: :cascade do |t|
    t.integer  "training_course_id"
    t.string   "name"
    t.string   "header"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "divides", ["training_course_id"], name: "index_divides_on_training_course_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "classify",                 default: 1
    t.string   "picture_url"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "picture_url_file_name"
    t.string   "picture_url_content_type"
    t.integer  "picture_url_file_size"
    t.datetime "picture_url_updated_at"
    t.boolean  "is_competition"
  end

  create_table "journals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "training_course_id"
    t.string   "title"
    t.text     "content"
    t.datetime "add_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "journals", ["training_course_id"], name: "index_journals_on_training_course_id"
  add_index "journals", ["user_id"], name: "index_journals_on_user_id"

  create_table "manager_feedbacks", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "training_course_id"
    t.string   "organizer"
    t.string   "total_hours"
    t.string   "total_expenses"
    t.text     "total_expenses_info"
    t.text     "feedback"
    t.text     "remark"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "manager_feedbacks", ["admin_id"], name: "index_manager_feedbacks_on_admin_id"
  add_index "manager_feedbacks", ["training_course_id"], name: "index_manager_feedbacks_on_training_course_id"

  create_table "materials", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "catalog"
    t.string   "mdate"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.string   "sub_title"
    t.integer  "view_count", default: 0
    t.string   "author"
    t.text     "content"
    t.string   "category"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "signs", force: :cascade do |t|
    t.integer  "training_course_id"
    t.integer  "user_id"
    t.datetime "sign_time"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "syllabus_id"
    t.string   "title"
    t.string   "teacher"
    t.string   "address"
  end

  add_index "signs", ["syllabus_id"], name: "index_signs_on_syllabus_id"
  add_index "signs", ["training_course_id"], name: "index_signs_on_training_course_id"
  add_index "signs", ["user_id"], name: "index_signs_on_user_id"

  create_table "student_feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "training_course_id"
    t.string   "teach"
    t.string   "discussion"
    t.string   "visiting"
    t.string   "organization"
    t.string   "study_life"
    t.text     "most_value"
    t.text     "most_gain"
    t.text     "graduate_message"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "student_feedbacks", ["training_course_id"], name: "index_student_feedbacks_on_training_course_id"
  add_index "student_feedbacks", ["user_id"], name: "index_student_feedbacks_on_user_id"

  create_table "syllabuses", force: :cascade do |t|
    t.integer  "training_course_id"
    t.datetime "course_time"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "address"
    t.string   "teacher"
    t.boolean  "is_active",          default: false
  end

  add_index "syllabuses", ["training_course_id"], name: "index_syllabuses_on_training_course_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "title",                          null: false
    t.text     "body",                           null: false
    t.integer  "submit_user_count",  default: 0
    t.integer  "training_course_id",             null: false
    t.integer  "admin_id",                       null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "tasks", ["admin_id"], name: "index_tasks_on_admin_id"
  add_index "tasks", ["training_course_id"], name: "index_tasks_on_training_course_id"

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "id_card"
    t.string   "position"
    t.boolean  "sex",        default: true
    t.text     "remark"
    t.string   "address"
    t.string   "mobile"
    t.string   "phone"
    t.string   "qq"
    t.string   "email"
    t.string   "postcode"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "school_id"
    t.string   "job_title"
  end

  create_table "todos", force: :cascade do |t|
    t.text     "content"
    t.boolean  "state",      default: false
    t.integer  "admin_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "todos", ["admin_id"], name: "index_todos_on_admin_id"

  create_table "training_course_teachers", force: :cascade do |t|
    t.integer  "training_course_id"
    t.integer  "teacher_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "training_course_teachers", ["teacher_id"], name: "index_training_course_teachers_on_teacher_id"
  add_index "training_course_teachers", ["training_course_id"], name: "index_training_course_teachers_on_training_course_id"

  create_table "training_courses", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "plan_number"
    t.string   "training_address"
    t.decimal  "training_fee",        precision: 10, scale: 2
    t.string   "state"
    t.text     "remark"
    t.text     "info"
    t.text     "training_background"
    t.text     "training_target"
    t.text     "training_content"
    t.text     "check_method"
    t.string   "project_leader"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.string   "contact"
    t.integer  "school_id"
    t.string   "aasm_state"
    t.string   "category"
    t.string   "grade_leader"
    t.boolean  "be_applied",                                   default: false
    t.integer  "notification_id"
    t.datetime "start_apply_time"
    t.datetime "end_apply_time"
    t.integer  "admin_id"
    t.string   "linkman"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile"
    t.string   "email"
    t.datetime "task_end_time"
    t.integer  "journal_number"
  end

  add_index "training_courses", ["admin_id"], name: "index_training_courses_on_admin_id"
  add_index "training_courses", ["notification_id"], name: "index_training_courses_on_notification_id"

  create_table "user_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.boolean  "status",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "user_messages", ["message_id"], name: "index_user_messages_on_message_id"
  add_index "user_messages", ["user_id"], name: "index_user_messages_on_user_id"

  create_table "user_tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.string   "title"
    t.string   "content"
    t.string   "appraise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_tasks", ["task_id"], name: "index_user_tasks_on_task_id"
  add_index "user_tasks", ["user_id"], name: "index_user_tasks_on_user_id"

  create_table "user_training_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "training_course_id"
    t.boolean  "state",              default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "remark"
    t.string   "certificate_no"
    t.integer  "divide_id"
    t.datetime "deleted_at"
  end

  add_index "user_training_courses", ["divide_id"], name: "index_user_training_courses_on_divide_id"
  add_index "user_training_courses", ["training_course_id"], name: "index_user_training_courses_on_training_course_id"
  add_index "user_training_courses", ["user_id"], name: "index_user_training_courses_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",   null: false
    t.string   "encrypted_password",                default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "ID_number"
    t.boolean  "gender",                            default: true
    t.date     "birth"
    t.string   "school"
    t.string   "academy"
    t.string   "certificate"
    t.string   "nation"
    t.string   "position_name"
    t.string   "position"
    t.string   "address"
    t.string   "zip_code"
    t.string   "telephone"
    t.string   "phone"
    t.string   "qq_no"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.text     "his_train"
    t.string   "profession"
    t.integer  "role"
    t.string   "authentication_token",   limit: 30
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
