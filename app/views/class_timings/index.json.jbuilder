json.array!(@class_timings) do |class_timing|
  json.extract! class_timing, :id, :name
  json.url class_timing_url(class_timing, format: :json)
end
