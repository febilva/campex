class StudentAttendanceRegister < ActiveRecord::Base
  belongs_to :batch
  belongs_to :user
  belongs_to :period
end
