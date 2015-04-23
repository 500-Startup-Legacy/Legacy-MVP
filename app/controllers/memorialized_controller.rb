
class MemorializedController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @memorialized_users = @user.memorialized_users
  end

  def show
    @user = User.find(params[:user_id])
    @memorialized_user = User.find(params[:id])
  end

end
