# == Schema Information
#
# Table name: syllabuses
#
#  id                 :integer          not null, primary key
#  training_course_id :integer
#  school_id          :integer
#  course_time        :datetime
#  title              :string(255)
#  content            :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  teachers_id        :integer
#  address            :string(255)
#

FactoryGirl.define do
  factory :syllabus do
    training_course_id 1
    school_id 1
    course_time "#{Time.zone.now}"
    title "XXXXXX培训课"
    content "课程内容XX"
  end
end
