class RoomsController < ApplicationController
  before_action :join_require, only: [:show]

  def index
  end

  def show
    @room = Room.find(params[:id])
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

    def join_require
      room = Room.find(params[:id])
      unless RoomUser.find_by(user_id: current_user.id, room_id: params[:id])
        redirect_to new_room_user_path(room), notice: 'チャンネルにまだ参加していません。参加しますか？'
      end
    end
end
