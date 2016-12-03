json.extract! sign, :id, :sign_time, :created_at, :updated_at
json.user_name sign.user.try(:name)
json.training_course_name sign.training_course.try(:name)
json.school_name sign.school.try(:name)