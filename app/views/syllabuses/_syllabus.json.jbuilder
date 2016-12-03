json.extract! @syllabus, :id, :course_time, :title, :content, :created_at, :updated_at
json.training_course_name sign.training_course.try(:name)
json.school_name sign.school.try(:name)