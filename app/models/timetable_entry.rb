class TimetableEntry < ActiveRecord::Base
  belongs_to :timetable
  belongs_to :period
  belongs_to :teacher
  belongs_to :paper
  belongs_to :created_by, :class_name => User
end
