class Api::V1::PostsController < ApplicationController
  def index
    @posts = post_query.active.ordered.page(params[:page])
    render json: @posts, each_serializer: PostSerializer, root: resource
  end

  def show
    @post = post_query.find(params[:id])
    render json: @post, serializer: PostSerializer, root: resource
  end

private

  def post_query
    type == 'Post' ? Post : Post.where(type: type)
  end

  def resource
    type.downcase.pluralize
  end

  def type
    params[:type] || 'Post'
  end
end
