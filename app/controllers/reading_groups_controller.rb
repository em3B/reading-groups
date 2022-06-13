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
    @non_members = Member.all.where.not(reading_group_id: params[:id].to_i)
    @non_members.each_with_index do |m, i|
      @member = Member.where(user_id: m.user_id)
      @user = User.where(id: m.user_id)
      @member.first.reading_group_id = params[:id].to_i if params[:add_student][i + 1].to_i == 1
      @reading_group.users << @user if params[:add_student][i + 1].to_i == 1
    end
  end

  def delete_user
    @reading_group = ReadingGroup.find(params[:id])
    @reading_group.users.all.each_with_index do |u, i|
      @member = Member.where(user_id: u.id)
      @member.first.reading_group_id = nil if params[:student][i + 1].to_i == 1
      @reading_group.users.delete(u) if params[:student][i + 1].to_i == 1
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
