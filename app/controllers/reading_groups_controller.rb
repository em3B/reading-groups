class ReadingGroupsController < ApplicationController
  before_action :find_reading_group, only: %i[show]

  def index
    @reading_groups = ReadingGroup.where(user: current_user)
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
