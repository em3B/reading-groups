class Question < ApplicationRecord
  belongs_to :user
  belongs_to :daily_reading
end
