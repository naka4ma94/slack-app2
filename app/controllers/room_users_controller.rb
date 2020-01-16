class RoomUsersController < ApplicationController
  def new
    @room = Room.find(params[:format])
    @room_user = @room.room_users.build
  end

  def create
    room = Room.find(params[:room_user][:room_id])
    workspace = room.workspace
    room_user = room.room_users.build(room_user_params)
    if room_user.save
      redirect_to workspace_room_path(workspace,room)
    end
  end

  private
    def room_user_params
      params.require(:room_user).permit(:user_id, :room_id)
    end
end
