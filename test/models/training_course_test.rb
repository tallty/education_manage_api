# == Schema Information
#
# Table name: training_courses
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  code                :string(255)
#  start_time          :datetime
#  end_time            :datetime
#  plan_number         :integer
#  training_address    :string(255)
#  training_fee        :decimal(10, 2)
#  state               :string(255)
#  remark              :text(65535)
#  info                :text(65535)
#  training_background :text(65535)
#  training_target     :text(65535)
#  training_content    :text(65535)
#  check_method        :text(65535)
#  project_leader      :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  contact             :string(255)
#  school_id           :integer
#  aasm_state          :string(255)
#  category            :string(255)
#  grade_leader        :string(255)
#  be_applied          :boolean          default(FALSE)
#  notification_id     :integer
#  start_apply_time    :datetime
#  end_apply_time      :datetime
#  admin_id            :integer
#  linkman             :string(255)
#  phone               :string(255)
#  fax                 :string(255)
#  mobile              :string(255)
#  email               :string(255)
#

require 'test_helper'

class TrainingCourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
