class AddBoardIdToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :board_id, :integer
  end
end
