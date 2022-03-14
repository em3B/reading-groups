class DailyReading < ApplicationRecord
  belongs_to :text
  belongs_to :reading_group
  has_many :questions
  has_one :chatroom
  has_many :answers, through: :questions

  def userAnswered(student)
    self.answers.where(user: student)
  end
end
