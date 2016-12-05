json.extract! sign, :id, :title, :teacher, :address, :date, :time, :created_at, :updated_at

json.user_name sign.user.try(:name)
json.syllabus_title sign.syllabus.try(:title)