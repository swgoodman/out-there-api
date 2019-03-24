class Idea < ApplicationRecord

  # Idea object relationships
  belongs_to :user
  belongs_to :board
  has_many :comments
end
