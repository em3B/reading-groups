class MessagesController < ApplicationController
  before_action :find_message, only: %i[show]

  def show
  end

  def create
    puts "Are we getting here?"
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    # TODO" this should come from somwwhere else
    @daily_reading = DailyReading.find(2)
    if @message.save
      puts "Saved!"
      flash[:notice] = "Message sent!"
      # redirect_to daily_reading_path(@daily_reading, anchor: "message-#{@message.id}")
    else
      puts "not saving!"
      render "daily_readings/show" and return
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
