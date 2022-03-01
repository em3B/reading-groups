class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def create
    @answer = Answer.new(answer_params)
    @answer.save
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
