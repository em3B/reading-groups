class DailyReading < ApplicationRecord
  belongs_to :text
  belongs_to :reading_group
  has_many :questions
end
