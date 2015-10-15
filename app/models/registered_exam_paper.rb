class RegisteredExamPaper < ActiveRecord::Base
  belongs_to :exam_registration
  belongs_to :paper
end
