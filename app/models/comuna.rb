class Comuna < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :places, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {minimum: 3}
end
