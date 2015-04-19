class MemoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @memories_hash = @user.memories.group_by do |memory|
      memory.memorialized_user_id
    end
  end

end
