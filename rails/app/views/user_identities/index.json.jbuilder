json.array!(@user_identities) do |user_identity|
  json.extract! user_identity, :id, :user_id, :provider, :uid
  json.url user_identity_url(user_identity, format: :json)
end
