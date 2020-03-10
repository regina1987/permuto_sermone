class Idioma < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: {minimum: 3}
  validates :name, format: { with: /\A\D+\z/, message: "Numbers are not allowed" }
end
