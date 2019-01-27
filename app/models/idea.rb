class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :comments
  has_many :boards
end
