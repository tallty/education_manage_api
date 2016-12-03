require 'rails_helper'

RSpec.describe Sign, type: :model do
  it { should belong_to(:user) } 
  it { should belong_to(:school) }
  it { should belong_to(:training_course) }
end
