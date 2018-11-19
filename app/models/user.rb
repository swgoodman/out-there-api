class User < ApplicationRecord
  belongs_to :group
  has_many :boards, through: :groups
  has_many :ideas
  has_many :comments
end
