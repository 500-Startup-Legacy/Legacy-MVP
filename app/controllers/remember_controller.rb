class RememberController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    redirect_to root_path unless @user.public
  end

end
