class BoardUser < ApplicationRecord

  # Board User join table
  belongs_to :user
  belongs_to :board
end
