json.extract! admin_sign, :id, :title, :teacher, :address, :date, :time, :created_at, :updated_at

json.user_name admin_sign.user.try(:name)
json.syllabus_title admin_sign.syllabus.try(:title)