class RoomsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @workspace = Workspace.find(params[:workspace_id])
    @room = @workspace.rooms.build
  end

  def edit
  end

  def create
    @workspace = Workspace.find(params[:workspace_id])
    @room = @workspace.rooms.build(room_params)
    if @room.save
      RoomUser.create(user_id: current_user.id, room_id: @room.id)
      redirect_to @workspace, notice: 'チャンネルを作成しました。'
    else
      render :new
    end
  end

  private
    def room_params
      params.require(:room).permit(:name)
    end
end
