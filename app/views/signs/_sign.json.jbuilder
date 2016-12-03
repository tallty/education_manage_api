json.extract! sign, :id, :training_course_id, :school_id, :user_id, :sign_time, :created_at, :updated_at
json.user_name sign.user.try(:name)
json.training_course_name sign.training_course.try(:name)
json.school_name sign.school.try(:name)