class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def create
    # @user = User.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.username = current_user.name
    @comment.user_id = current_user.id
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
    # authorize! :edit, @comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    authorize! :edit, Comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    #@comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      respond_to do |format|
        if @comment.update_attributes(comment_params)
          format.html {redirect_to([@comment.post, @comment], :notice => "Successful")}
          format.xml {head :ok}
        else
          format.html {render :action => "edit"}
          format.xml {render :xml => @comment.errors, :status => :unprocessable_entity}
        end
      end
      else
        flash[:notice] = "Access denied"
        redirect_to posts_path
    end
  end

  # def update
  #   authorize! :edit, @comment
  #   if @comment.user_id == current_user.id
  #   # @post = Post.find(params[:post_id])
  #   # @comment = @post.comments.find(params[:id])
  #   # @comment = Comment.find(params[:id])
  #     @comment.update(comment_params)
  #     redirect_to posts_path
  #   end
  # end

  def destroy
    authorize! :destroy, Comment
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_url(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
