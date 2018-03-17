class Invited < ApplicationRecord
<<<<<<< HEAD
  belongs_to :order
  belongs_to :user
=======
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
 	puts @txt
 	@event = Event.create(message: @txt, invited_id: self.id)
 end
>>>>>>> 4a42895aa39b4d9a77318b0c4bb9108d0c1e3e03
end
