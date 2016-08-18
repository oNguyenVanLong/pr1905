class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_back fallback_location: root_path
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user_id, :micropost_id)
    end
end
