class DailyReadingsController < ApplicationController
  before_action :find_daily_reading, only: %i[show]

  def show
  end

  private

  def find_daily_reading
    @daily_reading = DailyReading.find(params[:id])
  end

  def daily_reading_params
    params.require(:daily_reading).permit(:text_id, :reading_group_id)
  end
end
