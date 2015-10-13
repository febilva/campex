json.array!(@term_dates) do |term_date|
  json.extract! term_date, :id, :batch_id, :term_structure_entry_id, :start_date, :end_date
  json.url term_date_url(term_date, format: :json)
end
