json.array!(@paper_assignments) do |paper_assignment|
  json.extract! paper_assignment, :id, :teacher_id, :paper_id, :batch_id
  json.url paper_assignment_url(paper_assignment, format: :json)
end
