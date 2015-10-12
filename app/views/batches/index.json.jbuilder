json.array!(@batches) do |batch|
  json.extract! batch, :id, :course_id, :name, :code, :start_date, :end_date
  json.url batch_url(batch, format: :json)
end
