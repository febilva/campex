class Examination < ActiveRecord::Base
  belongs_to :course
  belongs_to :syllabus
  belongs_to :term_structure_entry
  has_and_belongs_to_many :batches
end
