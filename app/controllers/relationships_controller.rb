class RelationshipsController < ApplicationController
  # before_action :authorize_request, except: [:show]
  before_action :authorize_request

  def index
  #   @following_ids = @current_user.following_ids
  #   render json: @following_ids, status: :ok

    collectRelationships
    render json: { followers: @followers, following: @following }, status: :ok
  end

  # def show
  #   @user = User.find_by(username: params[:id])
  #   render json: @user.following_ids, status: :ok
    # @is_following = @current_user.following?(@other_user)
    # render json: {"is_following": @is_following}, status: :ok
  # end

  def create
    @user = User.find_by(username: params[:profile_username])
    @current_user.follow(@user) if @current_user.id != @user.id
    collectRelationships
    render json: { followers: @followers, following: @following }, status: :ok
  end

  def destroy
    @user = User.find_by(username: params[:id])
    @current_user.unfollow(@user) if @current_user.id != @user.id
    collectRelationships
    render json: { followers: @followers, following: @following }, status: :ok
  end

  def collectRelationships
    # @followers = @current_user.followers.map { |user| user.username }
    # @following = @current_user.following.map { |user| user.username }

    @followers = @current_user.passive_relationships.order(created_at: :desc)
    @following = @current_user.active_relationships.order(created_at: :desc)
    @followers = @followers.map { |relationship| User.find(relationship.follower_id).username }
    @following = @following.map { |relationship| User.find(relationship.followed_id).username }
  end
end
