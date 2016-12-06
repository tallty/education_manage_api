json.array!(@training_course_lists) do |training_course_list|
  json.extract! training_course_list, :id
  json.url training_course_list_url(training_course_list, format: :json)
end
