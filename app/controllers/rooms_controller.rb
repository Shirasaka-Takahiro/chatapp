class RoomsController < ApplicationController
  # before_action :authenticate_user!

  def index   
    @user = current_user.id
    @rooms = Room.all.order(:id)
  end

  def show
    @user = User.find_by(params[:id])
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def new
    if Room.create!
      redirect_to rooms_path
      flash[:notice] = "新規ルームを作成しました。"
    end
    
  end

  def destroy 
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to rooms_path
      flash[:notice] = "Room#{@room.id}を削除しました。"
    end
  end




end
