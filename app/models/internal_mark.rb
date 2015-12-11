class InternalMark < ActiveRecord::Base
  belongs_to :student
  belongs_to :term_structure_entry
  belongs_to :paper
  belongs_to :created_by, class_name: "User"
end
