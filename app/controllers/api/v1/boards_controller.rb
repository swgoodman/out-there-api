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
