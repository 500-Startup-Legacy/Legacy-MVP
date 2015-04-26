class Api::MemorializedController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user

  def index
    @user = User.find(params[:user_id])
    @memorialized_users = @user.memorialized_users
    render json: @memorialized_users
  end

  def show
    # render json: {'hello':'world'} if params[:id] == 'friends'
    @user = User.find(params[:user_id])
    @memorialized_user = User.find(params[:id])
    render json: @memorialized_user
  end

# c.memorialized_users.select {|u| c.get_relationship(u).group_tag == 'friend' }
  def family
    @user = User.find(params[:user_id])
    render json: @user.memorialized_users.select {|u| @user.get_relationship(u).group_tag == 'family' }
  end

  def friends
    @user = User.find(params[:user_id])
    render json: @user.memorialized_users.select {|u| @user.get_relationship(u).group_tag == 'friend' }
  end

  def coworkers
    @user = User.find(params[:user_id])
    render json: @user.memorialized_users.select {|u| @user.get_relationship(u).group_tag == 'coworker' }
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
