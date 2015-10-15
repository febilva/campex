class Examination < ActiveRecord::Base
  belongs_to :course
  belongs_to :syllabus
  belongs_to :term_structure_entry
  has_and_belongs_to_many :batches

  def papers
    Paper.where(syllabus: self.syllabus, term_structure_entry: self.term_structure_entry, exam_required: true)
  end

  def to_s
    self.code
  end
end
