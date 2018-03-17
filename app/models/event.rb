class Event < ApplicationRecord
  after_create_commit{notify}
  belongs_to :invited
  private
  def notify
  	@uid = Invited.find(self.invited_id).user_id
  	@oid = Order.find(Invited.find(self.invited_id).order_id).id
  	ActionCable.server.broadcast 'user_channel'+@uid.to_s, data: {msg: self.message, order_id: @oid, time: self.created_at}
  end
end
