class PostsController < ApplicationController
  def index
    @posts = Post.all.collect do |post|
      post.width_thumbnail = '280'
      post.height_thumbnail = post.width_thumbnail * (post.height / post.width)
      post
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
