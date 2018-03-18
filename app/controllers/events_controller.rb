class EventsController < ApplicationController
  def index
	  @inviteds = Invited.where(user_id: current_user.id)
	  @events = []
	  @inviteds.each do |i|
		@event = Event.find_by invited_id: i.id 
		@events.push(@event)
	  end
	  @events = @events.reverse
  end
end
