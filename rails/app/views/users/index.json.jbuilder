json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :homepage
  json.url user_url(user, format: :json)
end
