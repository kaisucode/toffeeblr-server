class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by_username(params[:username])
    if @user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { 
        token: token, 
        exp: time.strftime('%m-%d-%Y %H:%M') }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def self
    render json: {
      username: @current_user.username, 
      follower_count: @current_user.followers.length(), 
      following_count: @current_user.following.length() }, status: :ok
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end


