class TermStructureEntry < ActiveRecord::Base
  belongs_to :term_structure

  def to_s
    self.code
  end
end
