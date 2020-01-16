class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workspace = Workspace.find(params[:workspace_id])
    @rooms = @workspace.rooms
    @not_joined_rooms = @rooms - current_user.rooms
    @joined_rooms = @rooms & current_user.rooms
  end

  def show
    @workspace = Workspace.find(params[:workspace_id])
    @room = Room.find(params[:id])
    @rooms = @workspace.rooms & current_user.rooms
    @messages = @room.messages
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
      redirect_to workspace_room_path(@workspace,@room)
    else
      render :new
    end
  end

  def test
    
  end

  private
    def room_params
      params.require(:room).permit(:name)
    end
end
