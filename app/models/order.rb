class Order < ApplicationRecord
  belongs_to :user
  has_many :inviteds
  has_many :joineds

  has_attached_file :Menu, styles: { larg:"600x600>", medium: "300x300>", thumb: "50x50#" }
  validates_attachment_content_type :Menu, content_type: /\Aimage\/.*\z/

end
