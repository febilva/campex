class Department < ActiveRecord::Base
  has_many :course_types
end
