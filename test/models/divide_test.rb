# == Schema Information
#
# Table name: divides
#
#  id                 :integer          not null, primary key
#  training_course_id :integer
#  name               :string(255)
#  header             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class DivideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
