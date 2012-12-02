class PostsController < ApplicationController
  def index
    @posts = Post.select('id, post_type, title, content, width_thumbnail, height_thumbnail').where('is_deleted' => false, 'is_hidden' => false).order('created_at DESC')
  end
end
