class Board < ApplicationRecord
  has_many :users, through: :ideas
end
