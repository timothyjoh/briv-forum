class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    respond_to do |format|
        if @comment.save
          format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        else
          format.html { redirect_to @comment.post }
        end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :body, :picture, :picture_cache)
  end
end
