class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referrer
    else
      render "new"
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
