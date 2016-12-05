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
  # validates_presence_of :title, on: :create, message: "title不能为空"
  # validates_presence_of :teacher, on: :create, message: " teacher不能为空"
  # validates_presence_of :address, on: :create, message: "address不能为空" 

  def date
   	self.created_at.strftime("%Y-%m-%d")
  end 

  def time
  	self.created_at.strftime("%H:%M:%S")
  end
end
