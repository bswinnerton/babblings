class PostsController < ApplicationController
  def index
    @posts = Post.where('is_deleted' => false, 'is_hidden' => false).limit(15).order('created_at DESC')
  end
  def show
    @posts = Post.find(params[:id], :conditions => 'is_deleted = false')
  end
end
