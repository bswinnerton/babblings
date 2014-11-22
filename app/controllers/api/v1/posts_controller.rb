class Api::V1::PostsController < ApplicationController
  def index
    @posts = post_query.active.ordered.page(params[:page])
    render json: {posts: @posts}
  end

  def show
    @post = post_query.find(params[:id])
    render json: {posts: @post}
  end

private

  def post_query
    params[:type] ? Post.where(type: params[:type]) : Post
  end
end
