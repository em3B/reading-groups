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
      # redirect_to daily_reading_path(@daily_reading.find(2))
    else
      render "daily_readings/show"
    end

    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: { message: @message })
    )
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:user_id, :chat_id, :content)
  end
end
