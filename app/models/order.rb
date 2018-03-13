class Order < ApplicationRecord
  after_create_commit { create_event }
  belongs_to :user
  has_many :inviteds
  has_many :joineds

  has_attached_file :Menu, styles: { larg:"600x600>", medium: "300x300>", thumb: "50x50#" }
  validates_attachment_content_type :Menu, content_type: /\Aimage\/.*\z/




private

def create_event
  Event.create message: "A new order for you has been created"
end


end
