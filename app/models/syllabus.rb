class Syllabus < ActiveRecord::Base
  belongs_to :course

  def syllabus_name
    "#{self.course} - #{self}"
  end

  def to_s
    self.name
  end
end
