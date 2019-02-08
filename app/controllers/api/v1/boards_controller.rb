class Api::V1::BoardsController < ApplicationController
  def index
    boards = get_current_user.boards

    render json: boards
  end

  def create
    board = Board.find_or_create_by(name: board_params[:name])
    board.users << get_current_user
    board.save
    binding.pry
    render json: board
  end

  def show
    board = Board.find(params[:id])
    ideas = board.ideas
    render json: {board: board, ideas: ideas}
  end



  private

  def board_params
    params.require(:board).permit(
        :name,
        :id
      )
  end
end
