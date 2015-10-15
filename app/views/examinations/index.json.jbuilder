json.array!(@examinations) do |examination|
  json.extract! examination, :id, :course_id, :syllabus_id, :term_structure_entry_id, :name, :code, :registration_open_date, :registration_close_date, :start_date, :end_date
  json.url examination_url(examination, format: :json)
end
