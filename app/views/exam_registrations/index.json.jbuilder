json.array!(@exam_registrations) do |exam_registration|
  json.extract! exam_registration, :id, :examination_id, :student_id, :paper_count, :fees_paid
  json.url exam_registration_url(exam_registration, format: :json)
end
