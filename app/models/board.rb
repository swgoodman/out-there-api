class Board < ApplicationRecord
  has_many :users, {:through=>:ideas, :source=>"user"}
end
