class AnswersController < ApplicationController
  before_action :find_answer, only: %i[show update]

  def show
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    # @question = Question.find(params[:question_id])
    # @answer.question = @question
    @answer.user = current_user
    if @answer.save
      redirect_to reading_group_path(params[:answer][:reading_group_id].to_i)
    else
      render :new
    end
  end

  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @answer.question = @question
    @answer.user = current_user
    @answer.update(answer_params)

    redirect_to student_reading_group_daily_reading_path
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:question_id, :content)
  end

end
