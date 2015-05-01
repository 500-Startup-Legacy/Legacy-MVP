class MemoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @memories_hash = @user.memories.group_by do |memory|
      memory.memorialized_user_id
    end
  end
  
  def new

  end

  def create

    # @user = User.find(params[:user_id])
  	# Memory.create(:content => "ziggeo#{params[:videotoken]}", :user_id => params[:user_id], :memorialized_user_id => params[:memorialized_id])
  	# redirect_to @user

    @user = User.find(params[:user_id])
    @subject = Subject.find(params[:subject_id])
  	Memory.create(:content => "ziggeo#{params[:videotoken]}", :subject_id => params[:subject_id])
  	redirect_to @user
  end

end
