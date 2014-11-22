class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.active.ordered.page(params[:page]).per(40)
    render json: {posts: @posts}
  end

  def show
    @post = Post.find(params[:id])
    render json: {posts: @post}
  end

  def page
    @posts = Post.active.ordered.page(params[:page])
    render json: {posts: @posts}
  end
end
