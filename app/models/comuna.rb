class Comuna < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :places
end
