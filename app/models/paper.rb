class Paper < ActiveRecord::Base
  belongs_to :paper_type
  belongs_to :offered_by, foreign_key: "offered_by_id", class_name: "Department"
  has_many :programme_offerings
  has_many :syllabuses, through: :programme_offerings
  has_many :paper_assignments
  has_many :teachers, through: :paper_assignments

  def exam_required?
    self.exam_required ? "Yes" : "No"
  end

  def optional?
    self.optional ? "Yes" : "No"
  end
end
