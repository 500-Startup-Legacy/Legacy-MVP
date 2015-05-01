class SubjectsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user

  def new
    @user = User.find(params[:user_id])
    @subject = Subject.new()
  end

  def create
    @user = User.find(params[:user_id])
    subject = Subject.create!(subject_params)
    if subject
      success_messsage = "You've memorialized #{subject.name}!" 
      success_messsage += "  Text your memories of #{subject.name} to #{subject.twilio_number}" if subject.twilio_number
      flash[:success] = success_messsage
      redirect_to @user
    else
        # flash[:fail]  
      render 'new'
    end
    # @memorialized = User.find_by(email: params[:email])
    # relationship = @memorializer.memorialize!(@memorialized, params[:group_tag]) if @memorialized
    # if @memorialized && relationship
    #   success_messsage = "You've memorialized #{@memorialized.full_name}!" 
    #   success_messsage += "  Text your memories of #{@memorialized.full_name} to #{relationship.twilio_number}" if relationship.twilio_number
    #   flash[:success] = success_messsage
    #   redirect_to @memorializer
    # else
    #   if @memorialized
    #     flash[:fail] = "You're already memorializing #{@memorialized.full_name}!" 
    #   else
    #     flash[:fail] = "We couldn't find a user with this email address" 
    #   end
    #   render 'new'
    # end
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
