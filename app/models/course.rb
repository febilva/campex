class Course < ActiveRecord::Base
  belongs_to :course_type
  has_one :department, through: :course_type
end
