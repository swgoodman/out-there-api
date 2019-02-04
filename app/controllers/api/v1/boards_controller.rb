class Api::V1::BoardsController < ApplicationController
  def index
    board = Board.find_by(id: get_current_user.board_id)
    render json: board
  end

  def create
    board = Board.find_or_create_by(name: board_params[:name])
    binding.pry
    board.users << get_current_user
    board.save
    binding.pry
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
