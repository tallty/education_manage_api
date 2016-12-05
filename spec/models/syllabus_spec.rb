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

require 'rails_helper'

RSpec.describe Syllabus, type: :model do
  it { should belong_to(:training_course) }
  it { should have_many(:signs) }
end
