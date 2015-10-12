json.array!(@term_structure_entries) do |term_structure_entry|
  json.extract! term_structure_entry, :id, :term_structure_id, :name, :code
  json.url term_structure_entry_url(term_structure_entry, format: :json)
end
