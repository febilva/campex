class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.belongs_to :student_attendance_register, index: true, foreign_key: true
      t.references :absentee, polymorphic: true, index: true
      t.string :leave_type
      t.string :reason

      t.timestamps null: false
    end
  end
end
