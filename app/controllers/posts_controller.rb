class PostsController < ApplicationController
  def index
    @posts = Post.limited.recent
  end

  def show
    @post = Post.find(params[:id])
  end

  def page
    @posts = Post.limited.offset((params[:page].to_i - 1) * Post::MAX_PER_PAGE).recent
    render layout: false
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

private

  def post_params
    params.require(:post).permit(:format, :content)
  end
end
