class User < ApplicationRecord
  
  # User authentication and validation
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  # User object relationships
  has_many :board_users
  has_many :ideas
  has_many :boards, through: :board_users
end
