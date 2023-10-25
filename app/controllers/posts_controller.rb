class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    new_post = Post.create(content: params[:content], user_id: params[:user_id])
    render json: {post: new_post}
  end

  def index
    posts = Post.all
    render json: posts
  end

  def update
    post = Post.find_by(id: params[:id])
    if post
      if post.update(post.params)
        render json: post, status: :ok
      else
        render json: {errors: post.errors.full_messaages}, status: :unprocessable_entity
      end
    else
      render json: {error: 'Post not found'}, status: :not_found
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post
      post.destroy
      render json: {message: 'Post deleted'}, status: :no_content
    else
      render json: {error: 'Post not found'}, status: :not_found
    end
  end
end
