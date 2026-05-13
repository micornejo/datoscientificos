json.array!(@sessions) do |session|
  json.extract! session, :id, :user_id, :provider, :uid, :remote_ip, :user_agent, :closed_at
  json.url session_url(session, format: :json)
end
