class User < ApplicationRecord

  has_attached_file :uimage, styles: { larg:"600x600>", medium: "300x300>", thumb: "50x50#" }
  validates_attachment_content_type :uimage, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:omniauthable, :omniauth_providers => [:google_oauth2, :facebook]

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :orders
  has_many :inviteds
  has_many :joineds
  has_many :groups


  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
         user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        # user.image = auth.info.image # assuming the user model has an image
      end
    end
  
def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
  
end

  def generate_token(column)

    begin
  
      self[column] = SecureRandom.urlsafe_base64  
    end while user.exists?(column => self[column])
  
  end
end
