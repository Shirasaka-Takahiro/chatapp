class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :rememberable, :validatable, :omniauthable

  has_many :messages
  has_many :rooms

  mount_uploader :image, ImageUploader

  validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :email, presence: true, length: { minimum: 6 }, uniqueness: true

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      user = User.create(
        provider: auth.provider,
        uid:      auth.uid,
        username: auth.info.nickname,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        image: auth.info.image
      )
    end
 
    user
  end
 
  private
 
 
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
