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

end
