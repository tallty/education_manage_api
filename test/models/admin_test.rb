# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  role                   :integer
#  qq                     :string(255)
#  mobile                 :string(255)
#  state                  :string(255)
#  phone                  :string(255)
#  address                :string(255)
#  postcode               :string(255)
#  remark                 :text(65535)
#  username               :string(255)
#  adminable_id           :integer
#  adminable_type         :string(255)
#  school_id              :integer
#

require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
