json.array!(@admin_syllabuses) do |admin_syllabus|
  json.extract! admin_syllabus, :id
  json.url admin_syllabus_url(admin_syllabus, format: :json)
end
