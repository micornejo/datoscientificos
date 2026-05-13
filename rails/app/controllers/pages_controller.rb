class PagesController < ApplicationController

  def evento_1
    @event_registration = EventRegistration.new
    @event_registration.event_url = request.url
  end

end

