class ChatRoomsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @chat_rooms = ChatRoom.where(:id => ChatRoomsUsers.where(:user_id=> current_user.id).all.pluck(:chat_room_id) )
  end

  def new
    @users= User.where(:id => current_user.id)
    @chat_room = ChatRoom.new
    @chat_room_users = ChatRoomsUsers.new
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
    @message.chat_room_id = @chat_room.id
  end

  def create
    @chat_room = ChatRoom.new(:title => params["title"])
    @chat_room.save
    params["users"].each do |user_id|
      @chat_room_users = ChatRoomsUsers.new(chat_room_id: @chat_room.id, user_id: user_id)
      @chat_room_users.save
    end
    if @chat_room_users.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def edit
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @chat_room = ChatRoomsUsers.new(chat_room_id: @chat_room, user_id: params[:user_id])
    if @chat_room.save
      flash[:success] = 'user added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  private

  def chat_room_params
    byebug
    params.require(:chat_room).permit(:title, :user_id, :chat_room_id)
  end
end
