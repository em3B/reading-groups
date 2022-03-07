class AnswersController < ApplicationController
  before_action :find_answer, only: %i[show update]

  def index
    @answers = Answer.all.where(user: current_user)
    @answers.each do |a|
      @questions = a.question
      @daily_reading = @questions.daily_reading
    end
    @questions_with_answers = @daily_reading.questions.map do |question|
      {
        question: question,
        answer: question.user_answer(current_user) || Answer.new
      }
    end
  end

  def show
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    if @answer.save
      flash[:notice] = "Answer saved!"
      redirect_to daily_reading_path(params[:answer][:daily_reading_id].to_i)
    else
      render :new
    end
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    redirect_to daily_reading_path(params[:answer][:daily_reading_id])
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
