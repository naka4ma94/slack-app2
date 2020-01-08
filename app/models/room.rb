class Room < ApplicationRecord
  belongs_to :workspace
  has_many :room_users
  has_many :users, through: :room_users
end
