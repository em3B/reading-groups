class ReadingGroup < ApplicationRecord
  # belongs_to :user

  attr_accessor :add_name, :delete_name

  has_many :members
  has_many :users, through: :members
  has_many :daily_readings
  has_many :questions, through: :daily_readings
  has_many :texts, through: :daily_readings
end
