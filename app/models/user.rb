class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_many :users, through: :reading_groups
  has_many :members
  has_many :answers
  has_many :reading_groups, through: :members
  has_many :questions, through: :answers
  has_many :messages
  has_many :chatrooms, through: :messages

  def online?
    if self.last_sign_in_at
      # last_sign_in_at > 1.hour.ago
      !current_sign_in_ip.nil?
    end
  end
end
