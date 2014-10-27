class PostsController < ApplicationController
  def index
    @posts = Post.active.ordered.page(params[:page]).map(&:decorate)
  end

  def show
    @post = Post.find(params[:id]).decorate
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

  def page
    @posts = Post.active.ordered.page(params[:page]).map(&:decorate)
    render layout: false
  end

private

  def post_params
    params.require(:post).permit(:type, :content)
  end
end
