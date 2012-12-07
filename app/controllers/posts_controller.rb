class PostsController < ApplicationController
  def index
    @posts = Post.where(:is_deleted => 0, :is_hidden => 0).limit(15).order('created_at DESC')
  end

  def show
    @posts = Post.find(params[:id], :conditions => 'is_deleted = 0')
  end

  def page
    @posts = Post.where(:is_deleted => 0, :is_hidden => 0).limit(15).offset(params[:page].to_i * 15).order('created_at DESC')
    render :layout => 0
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      author: '1',
      content: params[:post][:content],
      post_type: params[:post][:content]
    )
    @post.save
  end
end
