json.array!(@authorization_requests) do |authorization_request|
  json.extract! authorization_request, :id, :request_user, :request_type, :request_params, :request_remarks, :approval_user, :approval_date, :approval_remarks, :status
  json.url authorization_request_url(authorization_request, format: :json)
end
