# == Schema Information
#
# Table name: syllabuses
#
#  id                 :integer          not null, primary key
#  training_course_id :integer
#  course_time        :datetime
#  title              :string(255)
#  content            :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  address            :string(255)
#  teacher            :string(255)
#

FactoryGirl.define do
  factory :syllabus do
    training_course_id 1
    course_time "#{Time.zone.now}"
    title "XXXXXX培训课"
    content "课程内容XX"
    teacher "XX老师"
    address "上海松江XXXX"
  end
end
