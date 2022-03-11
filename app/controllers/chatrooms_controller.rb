class ChatroomsController < ApplicationController
  before_action :find_chatroom

  def find_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
end
