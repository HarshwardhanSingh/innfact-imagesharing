class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    @comment.save
    respond_to do |format|
      # format.html{ redirect_to :back }
      format.js {}
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html{ redirect_to :back }
      format.js {}
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
