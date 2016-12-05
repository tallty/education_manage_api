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

require 'rails_helper'

RSpec.describe Sign, type: :model do
  it { should belong_to(:user) } 
  it { should belong_to(:syllabus) }
end
