class Like < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

  validates :sender_id, uniqueness: {scope: :recipient_id, message: "cant interact twice with the same user"}
  validate :cant_interact_myself
  validates :sender, :recipient, presence: true

  def cant_interact_myself
    if self.sender == self.recipient
      errors.add(:expiration_date, "can't interact with myself")
    end
  end

end
