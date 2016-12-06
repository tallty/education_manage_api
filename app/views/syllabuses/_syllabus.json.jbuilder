json.extract! syllabus, :id, :course_time, :title, :content, :teacher, :address, :if_active, :created_at, :updated_at
json.training_course_name syllabus.training_course.try(:name)

json.signs syllabus.signs do |sign|
	json.partial! 'signs/sign', sign: sign
end