class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.bigint :user_id
      t.string :header
      t.string :body
      t.integer :likes
      t.index ["user_id"], name: "index_todos_on_user_id"
    end
  end
end
