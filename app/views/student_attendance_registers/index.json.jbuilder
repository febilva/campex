json.array!(@student_attendance_registers) do |student_attendance_register|
  json.extract! student_attendance_register, :id, :batch_id, :teacher_id, :period_id, :marked_date
  json.url student_attendance_register_url(student_attendance_register, format: :json)
end
