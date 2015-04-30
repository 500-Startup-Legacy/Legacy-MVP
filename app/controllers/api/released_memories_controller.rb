# match '/released_users/:released_user_id/memorialized/:user_id/memories', to: 'released_memories#index', via: 'get'
class Api::ReleasedMemoriesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @released_user = User.find(params[:released_user_id])
    payload = {}

    # payload = @released_user.memories.select { |memory| memory.memorialized_user_id == @user.id } if @user
    # payload = {'Error': 'No user by that id is in the system'} unless @user
    # payload = {'Error': "User #{@released_user.id} has not released their memories"} unless @released_user.public
    # payload = {'Error': "User #{@user.id} is not signed in"} unless current_user?(@user)

    render json: payload

  end

end

