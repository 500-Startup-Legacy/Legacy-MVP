class SubjectsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user

  def new
    @user = User.find(params[:user_id])
    @subject = Subject.new()
  end

  def create
    @user = User.find(params[:user_id])
    @subject = Subject.new(subject_params)
    if @subject.save
      success_messsage = "You've memorialized #{@subject.name}!" 
      success_messsage += "  Text your memories of #{@subject.name} to #{@subject.twilio_number}" if @subject.twilio_number
      flash[:success] = success_messsage
      redirect_to @user
    else
      render 'new'
    end
  end

  def subject_params
    params.permit(:name, :email, :group_tag, :user_id)
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
