class Board < ApplicationRecord
  belongs_to :group
  has_many :ideas
end
