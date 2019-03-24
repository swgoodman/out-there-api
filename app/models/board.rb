class Board < ApplicationRecord

  # Board object relationships
  has_many :board_users
  has_many :users, through: :board_users
  has_many :ideas
end
