class Order < ApplicationRecord
  belongs_to :user
  has_many :inviteds, dependent: :delete_all
  has_many :joineds, dependent: :delete_all
  
  has_attached_file :Menu, styles: { larg:"600x600>", medium: "300x300>", thumb: "50x50#" }
  validates_attachment_content_type :Menu, content_type: /\Aimage\/.*\z/

end
