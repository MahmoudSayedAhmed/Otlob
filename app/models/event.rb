class Event < ApplicationRecord
  after_create_commit{notify}
  belongs_to :invited
  private
  def notify
  	@uid = User.find(Invited.find(self.invited_id).user_id).id
  	ActionCable.server.broadcast 'user_channel'+@uid.to_s, data: self.message
  end
end
