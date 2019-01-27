class Api::V1::BoardsController < ApplicationController
  def index
    boards = get_current_user.boards.all
    render json: boards
  end

  def create
    board = get_current_user.board.find_or_create_by(name: board_params.name)
    board.save

    render json: board
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy

    render json: idea
  end

  private

  def idea_params
    params.require(:board).permit(
        :name
      )
  end
end
