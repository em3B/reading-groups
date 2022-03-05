class MessagesController < ApplicationController
  before_action :find_message, only: %i[show]

  def show
  end

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      flash[:notice] = "Message sent!"
      redirect_to daily_reading_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "daily_readings/show"
    end
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:user_id, :chat_id, :content)
  end
end
