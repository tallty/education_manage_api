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

require 'rails_helper'

RSpec.describe Sign, type: :model do
  it { should belong_to(:user) } 
  it { should belong_to(:syllabus) }
end
