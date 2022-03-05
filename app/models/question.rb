class Question < ApplicationRecord
  belongs_to :daily_reading
  has_one :reading_group, through: :daily_readings
  has_many :answers

  def user_answer(user)
    answers.find_by(user: user)
  end
end
