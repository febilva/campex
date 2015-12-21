json.array!(@marks) do |mark|
  json.extract! mark, :id, :registered_exam_paper_id, :mark, :entered_by
  json.url mark_url(mark, format: :json)
end
