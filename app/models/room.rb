class Room < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :workspace
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
end
