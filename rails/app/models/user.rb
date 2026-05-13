class User < ActiveRecord::Base
  has_many :user_identities
  has_many :input_submits
  has_many :roles

  def admin?
    roles.each { |role| return true if role.label == 'admin' }
    false
  end

  def registered?(event_url)
    EventRegistration.where(user_id: self.id, event_url: event_url).exists?
  end

end
