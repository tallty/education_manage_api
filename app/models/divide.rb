# == Schema Information
#
# Table name: divides
#
#  id                 :integer          not null, primary key
#  training_course_id :integer
#  name               :string(255)
#  header             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Divide < ActiveRecord::Base
  belongs_to :traing_course
  has_many :user_training_courses, dependent: :nullify  #关联的foreign key直接设置为空，避免删除关联对象
end
