class CourseType < ActiveRecord::Base
  belongs_to :department
  has_many :courses

  def to_s
    self.code
  end
end
