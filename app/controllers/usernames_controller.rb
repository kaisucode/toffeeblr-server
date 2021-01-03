class UsernamesController < ApplicationController
  before_action :set_user

  def show
    render 'users/show.jbuilder'
  end

  def set_user
    @user = User.find_by(username: params[:id])
  end

end
