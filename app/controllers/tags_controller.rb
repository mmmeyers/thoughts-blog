class TagsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @tags = @post.tags
  end

  def show
    @post = Post.find(params[:post_id])
    @tag = @post.tags.find(params[:id])
  end
  
end
