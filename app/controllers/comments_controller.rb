class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def create
    # @user = User.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.username = current_user.name
    if @comment.save
      redirect_to post_url(@post)
    else
      render "posts/show"
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      format.html
      format.xml {render :xml => @comment}
    end
  end


  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  # def update
  #   authorize! :update, @post.comment
  #   @post = Post.find(params[:post_id])
  #   # @comment = @post.comments.find(params[:id])
  #   @comment = Comment.find(params[:id])

  #   respond_to do |format|
  #     if @comment.update_attributes(params[:comment])
  #       format.html {redirect_to([@comment.post, @comment], :notice => "Successful")}
  #       format.xml {head :ok}
  #     else
  #       format.html {render :action => "edit"}
  #       format.xml {render :xml => @comment.errors, :status => :unprocessable_entity}
  #     end
  #   end
  # end

  def update
    authorize! :update, @post.comment
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to posts_path
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
