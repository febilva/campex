json.array!(@designations) do |designation|
  json.extract! designation, :id, :name, :code
  json.url designation_url(designation, format: :json)
end
