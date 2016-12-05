# == Schema Information
#
# Table name: signs
#
#  id                 :integer          not null, primary key
#  training_course_id :integer
#  school_id          :integer
#  user_id            :integer
#  sign_time          :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  syllabus_id        :integer
#  teachers_id        :integer
#

FactoryGirl.define do
  factory :sign do
    training_course_id 1
    school_id 1
    user_id 1
    syllabus_id 1
    sign_time "#{Time.zone.now}"
  end
end
