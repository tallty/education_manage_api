# == Schema Information
#
# Table name: user_messages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message_id :integer
#  status     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
