json.array!(@papers) do |paper|
  json.extract! paper, :id, :syllabus_id, :term_structure_entry_id, :paper_type_id, :name, :code, :study_mode
  json.url paper_url(paper, format: :json)
end
