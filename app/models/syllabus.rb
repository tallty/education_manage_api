class Syllabus < ActiveRecord::Base
  belongs_to :training_course
  belongs_to :school
  has_many :signs, dependent: :destroy
end
