json.array!(@feedback_entries) do |feedback_entry|
  json.extract! feedback_entry, :id, :feedback_field_id, :user_id, :value, :status, :post_id
  json.url feedback_entry_url(feedback_entry, format: :json)
end
