json.extract! training_course, :id, :name, :code, :start_time, :end_time, :plan_number, :training_address, :training_fee, :state, :remark, :info, :training_background, :training_target, :training_content, :check_method, :project_leader, :contact, :aasm_state, :category, :grade_leader, :be_applied, :start_apply_time, :end_apply_time, :linkman, :phone, :fax, :mobile, :email, :task_end_time, :journal_number, :created_at, :updated_at

json.admin_name training_course.admin.try(:name)
json.notification_title training_course.notification.try(:title)
json.school_name training_course.school.try(:name)