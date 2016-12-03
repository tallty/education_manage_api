json.array!(@syllabuses) do |syllabus|
  json.extract! syllabus, :id, :training_course_id, :school_id, :course_time, :title, :content
  json.url syllabus_url(syllabus, format: :json)
end
