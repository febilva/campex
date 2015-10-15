json.array!(@students) do |student|
  json.extract! student, :id, :batch_id, :admission_no, :roll_no
  json.url student_url(student, format: :json)
end
