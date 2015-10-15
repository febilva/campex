class ExamRegistration < ActiveRecord::Base
  belongs_to :examination
  belongs_to :student
  has_many :registered_exam_papers
  has_many :papers, through: :registered_exam_papers
end
