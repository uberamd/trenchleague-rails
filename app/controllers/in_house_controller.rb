class InHouseController < ApplicationController
  def show_match
  end

  def index
    @users = User.where.not(:in_house_elo => nil).order('in_house_elo DESC').all

    @chat_rooms = ChatRoom.all
    @new_chat_room = ChatRoom.new
  end

  def create_lobby
    authorize! :playinhouse, current_user

    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'InHouse Channel Created'
      redirect_to index_inhouse_path
    else
      render 'index'
    end
  end

  def show_lobby
    authorize! :playinhouse, current_user

    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])

    @message = Message.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
