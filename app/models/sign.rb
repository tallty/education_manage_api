class Sign < ActiveRecord::Base
  belongs_to :training_course
  belongs_to :school
  belongs_to :user
end
