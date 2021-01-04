class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]
  before_action :authorize_request, only: [:create, :update, :destroy, :explore]

  def explore
    # @posts = Post.all
    # render json: {"posts": @posts}, status: :ok

    @posts = Post.where.not(user: @current_user.following)
    @posts = @posts.where.not(user: @current_user)
    render 'posts/display.jbuilder'
  end

  def create
    @post = @current_user.posts.build(post_params)
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(user_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
