class TermDate < ActiveRecord::Base
  belongs_to :batch
  belongs_to :term_structure_entry
end
