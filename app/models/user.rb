class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  has_one_attached :material, dependent: :destroy
  belongs_to :comuna

  has_many :given_likes, :class_name => 'Like', :foreign_key => 'sender_id', dependent: :destroy
  has_many :received_likes, :class_name => 'Like', :foreign_key => 'recipient_id', dependent: :destroy

  has_and_belongs_to_many :idiomas,  dependent: :destroy

  has_many :messages,  dependent: :destroy
  has_many :conversations, :foreign_key => 'sender_id', dependent: :destroy
  has_many :received_messages, :class_name => 'Conversation', :foreign_key => 'recipient_id', dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    user.comuna =Comuna.all.sample
    user.photo = auth.info.image
    #user.photo = 'https://www.ibei.org/images/4611/person_box.png'
   end
  end



end
