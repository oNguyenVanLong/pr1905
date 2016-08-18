class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(content: params[:comment][:content],
      user_id: params[:user_id],
      micropost_id: params[:micropost_id])
    if @comment.save
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    else
      flash[:danger] = "Blank comment!"
      redirect_to root_url
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to :back
  end

  private
    def params_comment
      params.require(:comment).permit(:content, :user_id, :micropost_id)
    end
end
