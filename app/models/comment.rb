class Comment < ApplicationRecord

  # Comment object relationships
  belongs_to :idea
end
