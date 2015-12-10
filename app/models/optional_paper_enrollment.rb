class OptionalPaperEnrollment < ActiveRecord::Base
  belongs_to :batch
  belongs_to :student
  belongs_to :paper
end
