class PostsController < ApplicationController

  def index
    @posts = Post.where(:is_deleted => false, :is_hidden => false).limit(Rails.configuration.items_per_page).order('created_at DESC')
  end

  def show
    @posts = Post.find(params[:id], :conditions => ['is_deleted = ?', false])
  end

  def page
    @posts = Post.where(:is_deleted => false, :is_hidden => false).limit(Rails.configuration.items_per_page).offset(params[:page].to_i * Rails.configuration.items_per_page).order('created_at DESC')
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
    @post.image_from_url(params[:post][:content])
    render :action => :success if @post.save
  end

  def delete
    @post = Post.update(params[:id], :is_deleted => true)
    render :action => :succes if @post.save
  end

  def undelete
    @post = Post.update(params[:id], :is_deleted => false)
    render :action => :success if @post.save
  end

  def hide
    @post = Post.update(params[:id], :is_hidden => true)
    render :action => :success if @post.save
  end

  def unhide
    @post = Post.update(params[:id], :is_hidden => false)
    render :action => :success if @post.save
  end

end
