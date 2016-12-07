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

FactoryGirl.define do
  factory :sign do
    sequence( :user_id ) { | n | "#{n}" }
    sequence( :syllabus_id ) { | n | "#{n}" }
    # title "XXX课程"
    # teacher "XX老师"
    # address "上海松江XXXX"
  end
end
