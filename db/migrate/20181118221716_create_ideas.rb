class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.belongs_to :user
      t.belongs_to :board
      t.string :header
      t.string :body
      t.integer :likes
    end
  end
end
