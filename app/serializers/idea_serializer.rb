class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :header, :body

  has_many :comments
end
