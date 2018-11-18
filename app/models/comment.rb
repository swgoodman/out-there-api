class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :idea
end
