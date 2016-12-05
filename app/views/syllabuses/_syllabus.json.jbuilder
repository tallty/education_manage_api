json.extract! syllabus, :id, :course_time, :title, :content, :created_at, :updated_at
json.training_course_name syllabus.training_course.try(:name)
