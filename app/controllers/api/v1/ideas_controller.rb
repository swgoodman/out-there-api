class Api::V1::IdeasController < ApplicationController
  def index
    ideas = get_current_user.ideas.all

    render json: ideas
  end

  def create
    idea = get_current_user.ideas.build(idea_params)
    idea.save

    render json: idea
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy

    render json: idea
  end

  private

  def idea_params
    params.require(:idea).permit(
        :header,
        :body
      )
  end
end
