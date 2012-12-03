class PostsController < ApplicationController
  def index
    @posts = Post.where('is_deleted' => false, 'is_hidden' => false).limit(15).order('created_at DESC')
  end

  def show
    @posts = Post.find(params[:id], :conditions => 'is_deleted = false')
  end

  def page
    @posts = Post.where('is_deleted' => false, 'is_hidden' => false).limit(15).offset(params[:page].to_i * 15).order('created_at DESC')
    render :layout => false
  end
  
  def new
    @post = Post.new
  end

  def create
    raise params.inspect
  end
end
