class Invited < ApplicationRecord
  after_create_commit{create_event}
  belongs_to :order
  belongs_to :user
  has_many :events, :dependent => :destroy

 private
 def create_event
 	@name = User.find(Order.find(self.order_id).user_id).name
 	if Order.find(self.order_id).orderType
 		@orderType = "lunch"
 	else
 		@orderType = "breakfast"
 	end
 	@place = Order.find(self.order_id).place
 	@txt = @name+" invited you to "+@orderType+" from "+@place
 	@event = Event.create(message: @txt, invited_id: self.id, status: 0)
 end
end
