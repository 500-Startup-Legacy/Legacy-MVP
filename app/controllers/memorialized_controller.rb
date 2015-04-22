class MemorializedController < ApplicationController
  before_action :signed_in_user

  def index
    @user = User.find(params[:user_id])
    @memorialized_users = @user.memorialized_users
  end

  def show
    @user = User.find(params[:user_id])
    @memorialized_user = User.find(params[:id])
  end

  def new
    @memorializer = User.find(params[:user_id])
    @memorialized = User.new()
  end

  def create
    @memorializer = User.find(params[:user_id])
    @memorialized = User.find_by(email: params[:email])
    if @memorialized && @memorializer.memorialize!(@memorialized, params[:group_tag])
      flash[:success] = "You've memorialized #{@memorialized.full_name}!"
      redirect_to @memorializer
    else
      if @memorialized
        flash[:fail] = "You're already memorializing #{@memorialized.full_name}!" 
      else
        flash[:fail] = "We couldn't find a user with this email address" 
      end
      render 'new'
    end
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
end
