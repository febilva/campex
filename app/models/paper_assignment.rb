class PaperAssignment < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :paper
  belongs_to :batch
end
