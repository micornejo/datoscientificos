json.array!(@roles) do |role|
  json.extract! role, :id, :user_id, :label
  json.url role_url(role, format: :json)
end
