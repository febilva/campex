class Department < ActiveRecord::Base
  has_many :course_types
  has_many :courses, through: :course_types

  def to_s
    self.code
  end
end
