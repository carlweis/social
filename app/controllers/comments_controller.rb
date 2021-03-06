class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_id),
                  notice: 'Your comment has been posted.'
    else
      redirect_to post_path(@comment.post_id),
                  alert: 'Error creating comment'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    if @comment.destroy
      redirect_to post_path(@comment.post), notice: 'Comment Deleted!'
    else
      redirect_to post_path(@comment.post), alert: 'Failed to delete comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
