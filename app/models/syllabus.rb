class Syllabus < ActiveRecord::Base
  belongs_to :course
  belongs_to :term_structure_entry
end
