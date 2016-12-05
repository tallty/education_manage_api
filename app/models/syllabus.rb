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

class Syllabus < ActiveRecord::Base
  belongs_to :training_course
  belongs_to :school
  belongs_to :teacher
  has_many :signs, dependent: :destroy
end
