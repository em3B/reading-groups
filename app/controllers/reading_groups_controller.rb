class ReadingGroupsController < ApplicationController

  def index
    if current_user.teacher
      @reading_groups = ReadingGroup.where(user_id: current_user.id)
    else
      find_reading_group
      @daily_reading = @reading_group.daily_readings.select { |dr| dr.session_date == Date.today }
      redirect_to daily_reading_path(@daily_reading)
    end
  end

  def show
    @reading_group = ReadingGroup.find(params[:id])
    @answer = Answer.new
  end

  private

  def find_reading_group
    ReadingGroup.all.each do |reading_group|
      @reading_group = reading_group if reading_group.users.include?(current_user)
    end
  end

  def reading_group_params
    params.require(:reading_group).permit(:user_id)
  end
end
