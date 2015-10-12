class Course < ActiveRecord::Base
  belongs_to :course_type
  belongs_to :term_structure
  has_one :department, through: :course_type
  has_many :batches

  def to_s
    self.code
  end
end
