# == Schema Information
#
# Table name: signs
#
#  id                 :integer          not null, primary key
#  training_course_id :integer
#  user_id            :integer
#  sign_time          :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  syllabus_id        :integer
#  title              :string(255)
#  teacher            :string(255)
#  address            :string(255)
#

class Sign < ActiveRecord::Base
  belongs_to :user
  belongs_to :syllabus
  
  ################validates#####################
  validates_presence_of :syllabus_id, on: :create, message: " syllabus_id不能为空"
  validates_presence_of :user_id, on: :create, message: "user_id不能为空"

  validates_uniqueness_of :syllabus_id, on: :create, message: "您已经签到过了，不能重复签到 ！"

  scope :default_order, -> { order("created_at DESC") } #降序

  def self.get_user(id)#判断当前登录的学员是否报名了该培训项目
    self.syllabus.training_course.user_training_courses.where(user_id:id)
  end

  def date #签到日期
   	self.created_at.strftime("%Y-%m-%d")
  end 

  def time#签到时间
  	self.created_at.strftime("%H:%M:%S")
  end
end
