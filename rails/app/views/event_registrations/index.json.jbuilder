json.array!(@event_registrations) do |event_registration|
  json.extract! event_registration, :id, :user_id, :event_url
  json.url event_registration_url(event_registration, format: :json)
end
