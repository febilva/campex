class Syllabus < ActiveRecord::Base
  belongs_to :course
  belongs_to :term_structure_entry
  has_many :papers

  def to_s
    self.name
  end
end
