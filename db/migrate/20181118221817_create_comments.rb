class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.bigint :idea_id
      t.string :body
      t.integer :likes
      t.index ["idea_id"], name: "index_sub_todos_on_todo_id"
    end
  end
end
