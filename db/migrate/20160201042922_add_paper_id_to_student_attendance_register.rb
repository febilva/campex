class AddPaperIdToStudentAttendanceRegister < ActiveRecord::Migration
  def change
    add_reference :student_attendance_registers, :paper, index: true, foreign_key: true
  end
end
