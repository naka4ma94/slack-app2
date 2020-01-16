class Room < ApplicationRecord
  validates :name, presence: true
  validates :name, :uniqueness => { :scope => :workspace_id }

  belongs_to :workspace
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
end
