json.array!(@term_structures) do |term_structure|
  json.extract! term_structure, :id, :name
  json.url term_structure_url(term_structure, format: :json)
end
