class PostsController < ApplicationController
  def index
    @posts = post_query.active.ordered.page(params[:page]).per(40).map(&:decorate)
  end

  def show
    @post = post_query.find(params[:id]).decorate
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
    @posts = post_query.active.ordered.page(params[:page]).map(&:decorate)
    render layout: false
  end

  private

  def post_params
    params.require(:post).permit(:type, :content)
  end

  def post_query
    params[:type] ? Post.where(type: params[:type]) : Post
  end
end
