class RoomsController < ApplicationController

  def index   
    @user = current_user.id
    @rooms = Room.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
    @room = Room.find(params[:id])
    @messages = @room.messages
  end
end
