json.array!(@signs) do |sign|
  json.extract! sign, :id, :training_course_id, :school_id, :user_id, :sign_time
  json.url sign_url(sign, format: :json)
end
