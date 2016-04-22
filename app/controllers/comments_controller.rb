class CommentsController < ApplicationController

  def create
    # @user = User.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_url(@post)
    else
      render "posts/show"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    redirect_to post_path(@post.comment)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post.comment)
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :user)
    end

end
