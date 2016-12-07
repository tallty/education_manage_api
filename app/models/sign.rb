# == Schema Information
#
# Table name: signs
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  syllabus_id :integer
#

class Sign < ActiveRecord::Base
  belongs_to :user
  belongs_to :syllabus
  ################validates#####################
  validates_presence_of :syllabus_id, on: :create, message: " syllabus_id不能为空"
  validates_presence_of :user_id, on: :create, message: "user_id不能为空"

  validates_uniqueness_of :syllabus_id, on: :create, message: "您已经签到过了，不能重复签到 ！"

  scope :default_order, -> { order("created_at DESC") } #降序

  #判断当前登录的学员是否报名了该培训项目
  scope :get_user, -> (id){ where(user_id: id)}

  def date #签到日期
   	self.created_at.strftime("%Y-%m-%d")
  end 

  def time#签到时间
  	self.created_at.strftime("%H:%M:%S")
  end
end
