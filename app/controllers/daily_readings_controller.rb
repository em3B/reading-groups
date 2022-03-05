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
  end

  private

  def find_daily_reading
    @daily_reading = DailyReading.find(params[:id])
  end

  def daily_reading_params
    params.require(:daily_reading).permit(:text_id, :reading_group_id, :session_date)
  end
end
