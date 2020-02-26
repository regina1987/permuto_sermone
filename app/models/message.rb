class Message < ApplicationRecord
  belongs_to :conversation,  dependent: :destroy
  belongs_to :user,  dependent: :destroy
  validates_presence_of :body, :conversation_id, :user_id

  def message_time
     created_at.strftime("%m/%d/%y at %l:%M %p")
   end
end