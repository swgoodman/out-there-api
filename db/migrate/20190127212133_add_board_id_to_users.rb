class AddBoardIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :board_id, :integer
  end
end
