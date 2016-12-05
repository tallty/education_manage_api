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
  has_many :signs, dependent: :destroy

  ################validates#####################
  validates_presence_of :training_course_id, on: :create, message: " training_course_id不能为空"
  validates_presence_of :course_time, on: :create, message: "course_time不能为空"
  validates_presence_of :title, on: :create, message: "title不能为空"
  validates_presence_of :content, on: :create, message: " content不能为空"
  validates_presence_of :address, on: :create, message: "address不能为空"
  validates_presence_of :teacher, on: :create, message: "teacher不能为空"
end
