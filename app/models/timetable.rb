class Timetable < ActiveRecord::Base
  belongs_to :class_timing
  belongs_to :batch
  belongs_to :term_structure_entry
end
