class CommentsController < ApplicationController
  def destroy
    comment = Comment.find(params[:id])
    post    = comment.post

    comment.destroy

    redirect_to post
  end
end
