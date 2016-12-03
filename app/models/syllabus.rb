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

class Syllabus < ActiveRecord::Base
  belongs_to :training_course
  belongs_to :school
  has_many :signs, dependent: :destroy
end
