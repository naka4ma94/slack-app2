class WorkspaceUsersController < ApplicationController
  def new
    @workspace = Workspace.find(params[:format])
    @workspace_user = current_user.workspace_users.build
  end

  def create
    workspace_user = current_user.workspace_users.build(workspace_user_params)
    if workspace_user.save
      workspace = Workspace.find(params[:workspace_user][:workspace_id])
      room = workspace.rooms.find_by(name: "general")
      RoomUser.create(user_id: current_user.id, room_id: room.id)
      redirect_to workspaces_path
    end
  end

  private
    def workspace_user_params
      params.require(:workspace_user).permit(:user_id, :workspace_id)
    end
end
