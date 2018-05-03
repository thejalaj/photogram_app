class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      flash[:success] = 'message sent!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end
  private

  def message_params
    params.require(:message).permit(:body,:chat_room_id)
  end
end
