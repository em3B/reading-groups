class ReadingGroupsController < ApplicationController
  before_action :find_reading_group, only: %i[show]

  def index
    if current_user.teacher
      @reading_groups = []
      ReadingGroup.all.each do |rg|
        if rg.users.include?(current_user)
          @reading_groups << rg
        end
      end
    else
      @daily_reading = DailyReading.where(session_date: Date.today)
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
