json.array!(@timetables) do |timetable|
  json.extract! timetable, :id, :class_timing_id, :batch_id, :term_structure_entry_id, :start_date, :end_date
  json.url timetable_url(timetable, format: :json)
end
