class Api::V1::IdeasController < ApplicationController
  
  # Show all ideas of current board
  def index
    ideas = get_current_user.ideas.all
    
    render json: ideas
  end

  # Create new idea
  def create
    idea = get_current_user.ideas.build(idea_params)
    idea.board = Board.find_by(id: params[:board][:id])
    idea.save

    render json: idea
  end

  # Delete idea
  def destroy
    idea = Idea.find(params[:id])
    idea.destroy

    render json: idea
  end

  private

  # Acceptable idea params
  def idea_params
    params.require(:idea).permit(
        :header,
        :body
      )
  end
end
