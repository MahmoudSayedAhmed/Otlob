class User < ApplicationRecord

  has_attached_file :image, styles: { larg:"600x600>", medium: "300x300>", thumb: "50x50#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, :through => :friendships 
  has_many :orders
  has_many :inviteds
  has_many :joineds
  has_many :groups
end
