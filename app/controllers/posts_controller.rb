class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]
  before_action :soft_authorization_request, only: [:someposts]
  before_action :authorize_request, only: [:create, :update, :destroy, :explore]

  def explore
    @posts = Post.where.not("user_id IN (:following_ids) OR user_id = :user_id", 
                            following_ids: @current_user.following_ids, 
                            user_id: @current_user.id)
    render 'posts/display.jbuilder'
  end

  def someposts
    postIDs = params[:post_ids]
    @posts = params[:post_ids].map { |post_id| Post.find(post_id) }
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

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
