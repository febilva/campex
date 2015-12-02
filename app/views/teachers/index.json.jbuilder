json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :department_id, :designation_id, :employee_no
  json.url teacher_url(teacher, format: :json)
end
