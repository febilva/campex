class Timetable < ActiveRecord::Base
  belongs_to :class_timing
  belongs_to :batch
  belongs_to :term_structure_entry
  has_many :periods, through: :class_timing
end
