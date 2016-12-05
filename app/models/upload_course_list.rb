class UploadCourseList
  require 'roo'

  def self.upload_xls(input_file, output_path)
  	ActiveRecord::Base.transaction do
      xlsx = Roo::Excelx.new(input_file.tempfile)
      file = File.new("#{output_path}password.text", "w")
      
      4.upto( UploadUserList.get_sum(xlsx) ).each do |row|
				next if xlsx.formatted_value(row,"B").nil? # 表格中不存在工号

				_ch_user_type = xlsx.formatted_value(row,"V")
				raise "请填写正确的用户类型, \"领导\"、\"中层干部\"、\"职工\"" unless ['中层干部','领导','职工'].include?(_ch_user_type)
				_en_user_type = I18n.t :"user_type.#{_ch_user_type}"
				
				_job_num = UploadUserList.get_job_num(row,xlsx)

				_user = User.job_num(_job_num).try(:first)
				#确认 _user 对象
				if _user
					#存在该工号
					if _user.user_type != 'middle_manager' && _en_user_type == "middle_manager"
					 	#原不为中层干部 现为中层干部 
						#删除原 非中层干部账号 新建中层干部账号
						_user.delete #delete 保留原user_info  or destroy
						_user = MiddleManager.new(password: Password.new)
					end 
					#原为 中层干部  现不为中层干部
					#仅改变use_type 并在 创建自评表时加上user_type 条件限制
				else
					#不存在该工号 创建新user 并赋予新密码
					_user = _en_user_type == 'middle_manager' ? MiddleManager.new : User.new
				end 

				_user.job_num = UploadUserList.get_job_num(row,xlsx)
				_user.user_type = _en_user_type
				_user.take_part_in = activity_year
				_user.password = Password.new

				if _user.save!

					_user_info = UserInfo.new
					_user_info.user_id = _user.id

					_user_info.name = UploadUserList.get_name(row,xlsx) 
					_user_info.sex = UploadUserList.get_sex(row,xlsx) 
					_user_info.date_of_birth = UploadUserList.get_birth(row,xlsx) 
					_user_info.degree_of_education = UploadUserList.get_degree_of_education(row,xlsx) 
					_user_info.politics_status = UploadUserList.get_politics_status(row,xlsx) 
					_user_info.department_and_duty = UploadUserList.get_department(row,xlsx) + "  " + UploadUserList.get_duty(row,xlsx) 
					_user_info.starting_time_for_the_present_job = UploadUserList.get_time(row,xlsx) 

					_user_info.save!		

					file.write("姓名: #{_user_info.name},  工号: #{_user.job_num},  密码: #{_user.password},  用户类型: #{xlsx.formatted_value(row,"V")}\n")
				end
			end
			file.close
  	end
  end
end