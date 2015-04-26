class Api::MemoriesController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user

  def index
    @user = User.find(params[:user_id])
    render json: @user.memories.where(memorialized_user_id:params[:memorialized_id])
  end

  def show
    @user = User.find(params[:user_id])
    @memory = @user.memories.find(params[:id])
    render json: @memory
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
