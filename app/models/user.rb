class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :comuna,  dependent: :destroy

  has_many :given_likes, :class_name => 'Like', :foreign_key => 'sender_id', dependent: :destroy
  has_many :received_likes, :class_name => 'Like', :foreign_key => 'recipient_id', dependent: :destroy

  has_and_belongs_to_many :idiomas,  dependent: :destroy
  has_many :messages,  dependent: :destroy
    has_many :conversations,  dependent: :destroy
end
