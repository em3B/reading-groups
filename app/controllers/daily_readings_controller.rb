class DailyReadingsController < ApplicationController
  before_action :find_daily_reading, only: %i[show]
  attr_accessor :session_date

  def index
    # For student user
    ReadingGroup.all.each do |reading_group|
      @reading_group = reading_group if reading_group.users.include?(current_user)
    end
    @daily_readings = DailyReading.where(reading_group: @reading_group)
  end

  def show
    @answer = Answer.new
    @chatroom = Chatroom.find_by(daily_reading_id: params[:id])
    @message = Message.new

    find_students
    @questions_with_answers = @daily_reading.questions.map do |question|
      {
        question: question,
        answer: question.user_answer(current_user) || Answer.new
      }
    end
  end

  def new
    @daily_reading = DailyReading.new
  end

  def create
    @daily_reading = DailyReading.new(daily_reading_params)
    if @daily_reading.save
      redirect_to daily_reading_path(@daily_reading)
    else
      render :new
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
