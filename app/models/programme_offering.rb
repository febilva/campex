class ProgrammeOffering < ActiveRecord::Base
  belongs_to :syllabus
  belongs_to :paper
  belongs_to :term_structure_entry
end
