class Syllabus < ActiveRecord::Base
  belongs_to :course
  has_many :programme_offerings
  has_many :papers, through: :programme_offerings

  def syllabus_name
    "#{self.course} - #{self}"
  end

  def to_s
    self.name
  end
end
