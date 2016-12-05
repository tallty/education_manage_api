json.extract! admin_sign, :id, :date, :time, :created_at, :updated_at

json.user_name admin_sign.user.try(:name)
json.syllabus_title admin_sign.syllabus.try(:title)
json.syllabus_teacher admin_sign.syllabus.try(:teacher)
json.syllabus_address admin_sign.syllabus.try(:address)
json.syllabus_content admin_sign.syllabus.try(:content)