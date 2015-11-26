json.array!(@periods) do |period|
  json.extract! period, :id, :class_timing_id, :name, :start_time, :end_time, :is_break
  json.url period_url(period, format: :json)
end
