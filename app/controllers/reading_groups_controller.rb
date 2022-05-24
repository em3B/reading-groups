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

  def edit
    @reading_group = ReadingGroup.find(params[:id])
  end

  def add_user
    @reading_group = ReadingGroup.find(params[:id])
    User.all.each do |u|
      @reading_group.users << u if params[:todo] == 1
    end
  end

  def delete_user
    @reading_group = ReadingGroup.find(params[:id])
    @user = User.where(id: @reading_group.user_id)
    @reading_group.user_ids.include?(@user["id".to_i])
    @reading_group.users.all.each do |u|
      @reading_group.users << u if params[:todo] == 1
    end
  end

  def update
    add_user
    delete_user
    redirect_to edit_reading_group_path
  end

  private

  def find_reading_group
    ReadingGroup.all.each do |reading_group|
      @reading_group = reading_group if params[:todo] == 1
    end
  end

  def reading_group_params
    params.require(:reading_group).permit(:user_id)
  end
end
