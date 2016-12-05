class UploadCourseList
  require 'roo'

  def self.upload_xls(input_file, output_path)
  	# ActiveRecord::Base.transaction do
      xlsx = Roo::Excelx.new(input_file.tempfile)

      4.upto( UploadCourseList.get_sum(xlsx) ).each do |row|
				next if xlsx.formatted_value(row,"B").nil? # 表格中不存在工号

		_syllabus = Syllabus.new
		# _syllabus.user_id = _user.id
		
		_syllabus.title = UploadCourseList.get_title(row,xlsx) 
		_syllabus.content = UploadCourseList.get_content(row,xlsx) 
		_syllabus.address = UploadCourseList.get_address(row,xlsx) 
		_syllabus.course_time = UploadCourseList.get_course_time(row,xlsx) 
		# _syllabus.department_and_duty = UploadCourseList.get_department(row,xlsx) + "  " + UploadCourseList.get_duty(row,xlsx) 
		# _syllabus.starting_time_for_the_present_job = UploadCourseList.get_time(row,xlsx) 

		_syllabus.save!		
	  end
	  # file.close
  	# end
  end

  def self.get_sum(xlsx)
	i = 1
	xlsx.each_row_streaming do |row| 
	  i += 1  
	end	 
	i 
  end
end