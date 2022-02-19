class Member < ApplicationRecord
  belongs_to :reading_group
  belongs_to :user
end
