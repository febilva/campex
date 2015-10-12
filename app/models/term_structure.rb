class TermStructure < ActiveRecord::Base
  has_many :term_structure_entries

  def to_s
    self.name
  end
end
