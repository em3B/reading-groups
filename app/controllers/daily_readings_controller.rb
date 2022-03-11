class DailyReadingsController < ApplicationController
  before_action :find_daily_reading, only: %i[show]
  attr_accessor :session_date

  def index
    # For student user
    reading_group_id = current_user.reading_groups.first.id
    @daily_readings = DailyReading.where(reading_group: reading_group_id)
  end

  def show
    @answer = Answer.new
    # @chatroom = Chatroom.new
    # @chatroom.name = current_user.name
    @chatroom = Chatroom.find_by(daily_reading_id: DailyReading.first.id)
    # @chatroom = Chatroom.new(name: "bundo group")
    # @chatroom.save!
    @message = Message.new

    find_students
    # @questions = @daily_reading.questions
    # @answer = Answer.where(daily_reading_id: params[:id], user: current_user) || Answer.new
    # @answer = Answer.new
    @questions_with_answers = @daily_reading.questions.map do |question|
      {
        question: question,
        answer: question.user_answer(current_user) || Answer.new
      }
    end
  end

  private

  def find_daily_reading
    @daily_reading = DailyReading.find(params[:id])
  end

  def find_students
    @students = @daily_reading.reading_group.users.where.not(teacher: true)
  end

  def daily_reading_params
    params.require(:daily_reading).permit(:text_id, :reading_group_id, :session_date, :chatroom_id)
  end
end
