class Absence < ActiveRecord::Base
  belongs_to :student_attendance_register
  belongs_to :absentee, polymorphic: true
end
