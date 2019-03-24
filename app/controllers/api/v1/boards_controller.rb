class Api::V1::BoardsController < ApplicationController
  
  # Show all user boards
  def index
    boards = get_current_user.boards

    render json: boards
  end

  # Create new board
  def create
    board = Board.find_or_create_by(name: board_params[:name])
    board.users << get_current_user
    board.save

    render json: board
  end

  # Show current board
  def show
    board = Board.find(params[:id])
    ideas = board.ideas
    
    render json: {board: board, ideas: ideas}
  end

  private

  # Acceptable board params
  def board_params
    params.require(:board).permit(
        :name,
        :id
      )
  end
end
