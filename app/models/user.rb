class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :comuna

  has_many :given_likes, :class_name => 'Like', :foreign_key => 'sender_id'
  has_many :received_likes, :class_name => 'Like', :foreign_key => 'recipient_id'
end
