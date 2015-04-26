class Api::UsersController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
