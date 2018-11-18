class User < ApplicationRecord
  has_many :boards
  belongs_to :group
  has_many :ideas
  has_many :comments
end
