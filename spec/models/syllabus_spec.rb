require 'rails_helper'

RSpec.describe Syllabus, type: :model do
  it { should belong_to(:school) } 
  it { should belong_to(:training_course) }
  it { should have_many(:user_info) }
end
