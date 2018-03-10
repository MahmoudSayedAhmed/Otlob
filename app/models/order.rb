class Order < ApplicationRecord
  belongs_to :user
  has_many :inviteds
  has_many :joineds
end
