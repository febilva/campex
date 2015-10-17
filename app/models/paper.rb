class Paper < ActiveRecord::Base
  belongs_to :syllabus
  belongs_to :term_structure_entry
  belongs_to :paper_type
  belongs_to :offered_by, foreign_key: "offered_by_id", class_name: "Department"

  def exam_required?
    self.exam_required ? "Yes" : "No"
  end

  def optional?
    self.optional ? "Yes" : "No"
  end
end
