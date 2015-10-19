class Paper < ActiveRecord::Base
  belongs_to :paper_type
  has_many :programme_offerings
  has_many :syllabuses, through: :programme_offerings

  def exam_required?
    self.exam_required ? "Yes" : "No"
  end

  def optional?
    self.optional ? "Yes" : "No"
  end
end
