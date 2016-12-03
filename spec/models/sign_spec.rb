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
#

require 'rails_helper'

RSpec.describe Sign, type: :model do
  it { should belong_to(:user) } 
  it { should belong_to(:school) }
  it { should belong_to(:training_course) }
end
