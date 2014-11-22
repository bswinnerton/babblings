class PostsController < ApplicationController
  respond_to :html, :json

  def index
    @posts = Post.active.ordered.page(params[:page]).per(40).map(&:decorate)
    respond_with(@posts)
  end

  def show
    @post = Post.find(params[:id]).decorate
    respond_with(@post)
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
    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: @posts }
    end
  end

private

  def post_params
    params.require(:post).permit(:type, :content)
  end
end
