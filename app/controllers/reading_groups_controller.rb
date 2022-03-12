class ReadingGroupsController < ApplicationController
  before_action :find_reading_group, only: %i[show]

  def index
    if current_user.teacher
      @reading_groups = ReadingGroup.where(user_id: current_user.id)
    else
      # iterate through daily reading for that rg specifically?
      reading_group_id = current_user.reading_group_id
      @daily_readings = DailyReading.where(reading_group: reading_group_id)
      @daily_reading = @daily_readings.select { |dr| dr.session_date == Date.today }
      redirect_to daily_reading_path(@daily_reading.first.id)
    end
  end

  def show
    @answer = Answer.new
  end

  private

  def find_reading_group
    @reading_group = ReadingGroup.find(params[:id])
  end

  def reading_group_params
    params.require(:reading_group).permit(:user_id)
  end
end

# @reading_group = ReadingGroup.find(params[:id])
    # @daily_reading = DailyReading.find(params[:daily_reading_id])
    # @reading_group.daily_reading = @daily_reading
    # @reading_group.user = current_user
    #
