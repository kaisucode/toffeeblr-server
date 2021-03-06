class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authorize_request, only: [:update, :destroy, :feed]
  # before_action :find_user, except: %i[create index show]
  # [:index :show :create :update :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/1
  def show
    # render json: @user, status: :ok
    # render json: {user: @user, posts: @user.posts}, status: :ok

    render 'users/show.jbuilder'
    # if self, return user.posts.count and other private data
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if User.exists?(:username => @user.username)
      render json: @user.errors, status: :conflict
    elsif @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def feed
    # @posts = Post.where("user_id = ?", @current_user.id)
    @posts = Post.where(user: @current_user.following)
    @posts = @posts.order(created_at: :desc)
    render 'posts/display.jbuilder'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # def find_user
  #   @user = User.find_by(username: params[:username])
  # rescue ActiveRecord::RecordNotFound
  #   render json: { errors: 'User not found' }, status: :not_found
  # end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
