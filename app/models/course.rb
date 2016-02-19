class Course < ActiveRecord::Base
  belongs_to :course_type
  belongs_to :term_structure
  has_one :department, through: :course_type
  has_many :syllabuses
  has_many :batches
  has_many :term_structure_entries, through: :term_structure

  def full_name
    #byebug
    if self.course_type.code == "M.Com"
      "#{self.course_type}"
    else
      "#{self.course_type} #{self.name.capitalize}"
    end
  end

  def papers
    Syllabus.where(course: self).last.papers
  end

  def to_s
    self.code
  end
end
