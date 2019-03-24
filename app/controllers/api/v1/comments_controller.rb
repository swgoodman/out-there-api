class Api::V1::CommentsController < ApplicationController
  
  # Show all idea comments
  def index
    idea = get_current_user.ideas.find(params[:idea_id].to_i)
    comments = idea.comments.all

    render json: comments
  end

  # Create new comment
  def create
    idea = get_current_user.ideas.find(params[:idea_id].to_i)
    comment = idea.comments.build(comment_params)
    comment.save

    render json: comment
  end

  # Delete comment
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    render json: comment
  end

  private
  
  # Acceptable comment params
  def comment_params()
    params.require(:comment).permit(
      :body
    )
  end
end
