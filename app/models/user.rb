class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :orders
  has_many :inviteds
  has_many :joineds
  has_many :groups

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.provider = auth.provider
    user.uid = auth.uid
    user.password = Devise.friendly_token[0,20]
  end
end
end
