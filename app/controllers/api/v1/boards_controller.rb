class Api::V1::BoardsController < ApplicationController
  def index
    boards = get_current_user.boards.find_or_create_by(:name)
    binding.pry
    render json: boards
  end

  def create
    board = Board.new(board_params)
    board.save

    render json: board
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy

    render json: idea
  end

  private

  def board_params
    params.require(:board).permit(
        :name
      )
  end
end
