class LikesController < ApplicationController
  before_action :set_post
  before_action :authorize_request

  def like
    @post.likes.create(user_id: @current_user.id) if not already_liked?
    render json: @post.likes, status: :created, location: @post
  end

  def unlike
    @like = @post.likes.find_by(user_id: @current_user.id)
    @like.destroy if already_liked?
    render json: @post.likes, status: :ok
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: @current_user.id, post_id: params[:post_id]).exists?
  end
end
