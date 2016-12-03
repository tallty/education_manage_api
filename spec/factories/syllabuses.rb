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
#

FactoryGirl.define do
  factory :syllabus do
    training_course nil
    school nil
    course_time "2016-12-03 16:59:52"
    title "MyString"
    content "MyText"
  end
end
