json.extract! admin_sign, :id, :sign_time, :created_at, :updated_at

json.user_name admin_sign.user.try(:name)
json.training_course_name admin_sign.training_course.try(:name)
json.school_name admin_sign.school.try(:name)
json.syllabus_title admin_sign.syllabus.try(:title)