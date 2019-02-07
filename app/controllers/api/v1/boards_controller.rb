class Api::V1::BoardsController < ApplicationController
  def index
    boards = get_current_user.boards

    render json: boards
  end

  def create
    board = Board.find_or_create_by(name: board_params[:name])
    board.users << get_current_user
    board.save
    render json: board
  end

  def show
    board = Board.find(params[:id])
    ideas = board.ideas.all
    render json: {ideas: ideas, board: board}
  end



  private

  def board_params
    params.require(:board).permit(
        :name
      )
  end
end
