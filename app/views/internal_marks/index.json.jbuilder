json.array!(@internal_marks) do |internal_mark|
  json.extract! internal_mark, :id, :student_id, :term_structure_entry_id, :paper_id, :mark, :created_by
  json.url internal_mark_url(internal_mark, format: :json)
end
