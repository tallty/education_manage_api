class UploadCourseList
  require 'roo'

  def self.upload_xls(input_file)
  	ActiveRecord::Base.transaction do
      xlsx = Roo::Excelx.new(input_file.tempfile)

      3.upto( UploadCourseList.get_sum(xlsx) ).each do |row|
      	b = xlsx.formatted_value(row,"B")
      	c = xlsx.formatted_value(row,"C")
      	d = xlsx.formatted_value(row,"D")
      	e = xlsx.formatted_value(row,"E")
        f = xlsx.formatted_value(row,"F")

      	unless b.nil? && c.nil? && d.nil? && e.nil? && f.nil? 
      	  _syllabus = Syllabus.new
		      _syllabus.training_course_id = _syllabus.training_course.id
         
          _syllabus.course_time = UploadCourseList.get_course_time(row,xlsx)
		      _syllabus.title = UploadCourseList.get_title(row,xlsx) 
		      _syllabus.content = UploadCourseList.get_content(row,xlsx) 
		      _syllabus.address = UploadCourseList.get_address(row,xlsx) 
		      _syllabus.teacher = UploadCourseList.get_teacher(row,xlsx) 
		      _syllabus.save!		
      	else
      	  raise "您上传的课程表有请误，请检查并上传正确的 课程表！"
      	end
	  end
  	end
  end

  def self.get_sum(xlsx)
	i = 1
	xlsx.each_row_streaming do |row| 
	  i += 1  
	end	 
  i
  end
  
  def self.get_course_time(row,xlsx)
	  course_time = xlsx.formatted_value(row,"B")
  end

  def self.get_title(row,xlsx)
	  title = xlsx.formatted_value(row,"C")	
  end

  def self.get_teacher(row,xlsx)
	  teacher = xlsx.formatted_value(row,"D")	
  end

  def self.get_content(row,xlsx)
	  content = xlsx.formatted_value(row,"E")	
  end

  def self.get_address(row,xlsx)
	  address = xlsx.formatted_value(row,"F")	
  end
end