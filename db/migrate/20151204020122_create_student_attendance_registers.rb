class CreateStudentAttendanceRegisters < ActiveRecord::Migration
  def change
    create_table :student_attendance_registers do |t|
      t.belongs_to :batch, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :period, index: true, foreign_key: true
      t.date :marked_date

      t.timestamps null: false
    end
  end
end
