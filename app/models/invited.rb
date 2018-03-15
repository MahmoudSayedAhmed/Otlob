class Invited < ApplicationRecord
  #after_create_commit{create_event}
  belongs_to :order
  belongs_to :user

 private
 def create_event
 	#Event.create(message: 'name')
 end

end
