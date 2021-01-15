class CommentsController < ApplicationController
  before_action :set_post
  before_action :authorize_request

  def create
    @post.comments.create(user_id: @current_user.id, content: params[:comment])
    render json: @post.comments, status: :created, location: @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
