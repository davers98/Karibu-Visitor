class UserLog < ApplicationRecord
  belongs_to :user

  validates :sign_in_time, presence: true 
  validates :user_id, presence: true
end
