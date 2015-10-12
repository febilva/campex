json.array!(@syllabuses) do |syllabus|
  json.extract! syllabus, :id, :course_id, :term_structure_entry_id, :name
  json.url syllabus_url(syllabus, format: :json)
end
