class Workspace < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :rooms
  has_many :workspace_users
  has_many :users, through: :workspace_users
end
