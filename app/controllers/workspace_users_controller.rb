class WorkspaceUsersController < ApplicationController
  def new
    @workspace = Workspace.find(params[:format])
    @workspace_user = current_user.workspace_users.build
  end

  def create
    @workspace_user = current_user.workspace_users.build(workspace_user_params)
    if @workspace_user.save
      redirect_to workspaces_path, notice: 'ワークスペースに参加しました。'
    end
  end

  private
    def workspace_user_params
      params.require(:workspace_user).permit(:user_id, :workspace_id)
    end
end
