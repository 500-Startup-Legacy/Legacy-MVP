class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show, :update, :edit]
  before_action :correct_user, only: [:show, :update, :edit]

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

# {30=> [#<Memory:0x007fba9855f488 id: 13, content: "Sunnyside fo evah!", user_id: 29, memorialized_user_id: 30, ...],
#  31=> [#<Memory:0x007fba9854bf00 id: 12, content: "Love this guy!", user_id: 29, memorialized_user_id: 31, ...]}

  def show
    @user = User.find(params[:id])
    @subjects = @user.subjects
    # @memories_hash = @user.memories.group_by do |memory|
    #   memory.subject_id
    # end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Legacy App!"
      redirect_to @user
    else
      render 'new'
    end

  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :legacy_contact_email)
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
