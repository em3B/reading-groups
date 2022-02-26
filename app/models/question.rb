class Question < ApplicationRecord
  belongs_to :daily_reading
  has_one :reading_group, through: :daily_readings
end
