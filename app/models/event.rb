class Event < ApplicationRecord
  after_create_commit{notify}
  belongs_to :invited
  private
  def notify
  	@uid = Invited.find(self.invited_id).user_id
  	ActionCable.server.broadcast 'user_channel'+@uid.to_s, data: self.message
  end
end
