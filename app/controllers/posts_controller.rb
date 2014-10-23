class PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).map(&:decorate)
  end

  def show
    @post = Post.find(params[:id]).decorate
  end

  def new
    @post = Post.new
  end

  def create
    @post = post_format_from_params.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def page
    @posts = Post.all.page(params[:page]).map(&:decorate)
    render layout: false
  end

private

  def post_params
    params.require(:post).permit(:content)
  end

  def post_format_from_params
    format = params[:post][:type]
    format.constantize if Post.formats.include? params[:post][:type]
  end
end
