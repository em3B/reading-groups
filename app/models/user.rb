class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :users, through: :reading_groups
  has_many :members
  has_many :answers
  has_many :reading_groups, through: :members
  has_many :questions, through: :answers
  has_many :messages
  has_many :chatrooms, through: :messages
end
