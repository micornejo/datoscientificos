class EventRegistration < ActiveRecord::Base
  validates :user_id, presence: true
  validates :event_url, presence: true
end
