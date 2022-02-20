class QuestionsController < ApplicationController
  before_action :find_question, only: [:show]

  def show
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:user_id, :daily_reading_id)
  end
end
