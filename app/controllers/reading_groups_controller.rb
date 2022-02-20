class ReadingGroupsController < ApplicationController
  before_action :find_reading_group, only: %i[index show]

  def index
    @reading_group = ReadingGroup.where(user: current_user)
  end

  def show
  end

  private

  def find_reading_group
    @reading_group = ReadingGroup.find(params[:id])
  end

  def reading_group_params
    params.require(:reading_group).permit(:user_id)
  end
end
