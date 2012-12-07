class PostsController < ApplicationController

  def index
    @posts = Post.where(:is_deleted => 0, :is_hidden => 0).limit(Rails.configuration.items_per_page).order('created_at DESC')
  end

  def show
    @posts = Post.find(params[:id], :conditions => 'is_deleted = 0')
  end

  def page
    @posts = Post.where(:is_deleted => 0, :is_hidden => 0).limit(Rails.configuration.items_per_page).offset(params[:page].to_i * Rails.configuration.items_per_page).order('created_at DESC')
    render :layout => false
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
