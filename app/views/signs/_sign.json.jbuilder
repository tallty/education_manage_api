json.extract! sign, :id, :date, :time, :created_at, :updated_at

json.user_name sign.user.try(:name)
json.syllabus_title sign.syllabus.try(:title)
json.syllabus_teacher sign.syllabus.try(:teacher)
json.syllabus_address sign.syllabus.try(:address)
json.syllabus_content sign.syllabus.try(:content)