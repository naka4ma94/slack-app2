class WorkspacesController < ApplicationController
  def index
    @workspaces = current_user.workspaces
  end

  def show
    @workspace = Workspace.find(params[:id])
    @rooms = @workspace.rooms && current_user.rooms
  end

  def new
    @workspace = Workspace.new
  end

  def edit
  end

  def create
    @workspace = Workspace.new(workspace_params)
    if @workspace.save
      WorkspaceUser.create(user_id: current_user.id, workspace_id: @workspace.id)
      redirect_to workspaces_path, notice: 'ワークスペースを作成しました。'
    else
      render :new
    end
  end

  def search
    @q = Workspace.ransack(params[:q])
    @workspaces = @q.result(distinct: true)
  end

  def result
    @q = Workspace.search(search_params)
    @workspaces = @q.result(distinct: true)
  end

  private
    def workspace_params
      params.require(:workspace).permit(:name)
    end

    def search_params
      params.require(:q).permit(:name_cont)
    end
end
